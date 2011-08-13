class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :dish, :inverse_of => :reviews
 
  has_many :votes
  
  accepts_nested_attributes_for :dish, :allow_destroy => :true,
       :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
      
        def getScore
          getUpVotes - getDownVotes
        end
                 
private       
       def after_initialize
         if new_record?
           max_users ||= 10
         end
       end
       
       def getUpVotes
            upvotes =  Vote.all(:conditions => ["score = 1 and review_id = ?", self.id]) ? Vote.all(:conditions => ["score = 1 and review_id = ?", self.id]).size : 0
        end

        def getDownVotes
              downvotes = Vote.all(:conditions => ["score = -1 and review_id = ?", self.id] ) ? Vote.all(:conditions => ["score = -1 and review_id = ?", self.id]).size : 0
        end
       
       
end

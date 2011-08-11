module ReviewsHelper
  
   def getUpVotes(rid)
        upvotes =  Vote.all(:conditions => ["score = 1 and review_id = ?", rid]) ? Vote.all(:conditions => ["score = 1 and review_id = ?", rid]).size : 0
    end

    def getDownVotes(rid)
        downvotes = Vote.all(:conditions => ["score = -1 and review_id = ?", rid] ) ? Vote.all(:conditions => ["score = -1 and review_id = ?", rid]).size : 0
    end

    def getScore(rid)
      getUpvotes - getDownVotes
    end
    
end

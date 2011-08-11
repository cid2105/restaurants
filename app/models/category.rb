class Category < ActiveRecord::Base
  has_many :restaurants, :inverse_of => :category
  
  def to_s
    self.name
  end
  
end

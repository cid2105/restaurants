class Dish < ActiveRecord::Base
  has_many :reviews, :inverse_of => :dish
  belongs_to :restaurant, :inverse_of => :dishes
  validates :name, :price, :presence => true
  validates_uniqueness_of :name
  
  def to_s
    name.capitalize
  end
  
  def top_review
    self.reviews.all.sort_by{ |review| review.getScore }.reverse[0]
  end

  def recommend?
    return self.getAverageScore > 0.50 ? true: false
  end
  
  def getAverageScore
    self.reviews.all(:conditions => {:recommend => true}).length / self.reviews.all.length
  end
  
  def getAveragePrice
   (self.reviews.all.sum(&:price) ) / ( self.reviews.all.length)
  end
  
end

class Dish < ActiveRecord::Base
  has_many :reviews
  belongs_to :restaurant, :inverse_of => :dishes
  validates :name, :price, :presence => true
  validates_uniqueness_of :name
end

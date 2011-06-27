class Dish < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :review
  validates :name, :street, :price, :presence => true
  validates_uniqueness_of :name
end

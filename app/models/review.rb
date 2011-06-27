class Review < ActiveRecord::Base
  belongs_to :restaurant
  has_one :dish
end

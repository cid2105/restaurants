class Restaurant < ActiveRecord::Base
  validates :name, :street, :city, :zip, :length => {:minimum => 3}, :presence => true
  validates :state, :presence => true, :length => {:minimum => 2}
  validates :number, :presence => true, :length => {:minimum => 10}
  has_many :reviews
  has_many :tags
  has_many :dishes
  belongs_to :category
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end

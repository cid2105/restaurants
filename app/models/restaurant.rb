class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :tags
  has_many :dishes, :inverse_of => :restaurant
  belongs_to :category, :inverse_of => :restaurants
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :dishes, :allow_destroy => :true,
       :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
       
  def to_s
    "#{self.name.titleize}"
  end
  
  def formatted_address
    "#{self.street}, #{self.city}, #{self.state}, #{self.zip}"
  end
  
end

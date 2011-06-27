class AddHelpfulToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :helpful, :int
    add_column :reviews, :unhelpful, :int
    add_column :reviews, :price, :float
    add_column :reviews, :recommend, :boolean
  end

  def self.down
    remove_column :reviews, :helpful
    remove_column :reviews, :unhelpful
    remove_column :reviews, :price
    remove_column :reviews, :recommend
  end
end

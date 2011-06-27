class AddDishToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :dish, :string
  end

  def self.down
    remove_column :reviews, :dish
  end
end

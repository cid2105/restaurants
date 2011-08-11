class RemoveDishFromReviews < ActiveRecord::Migration
  def self.up
    remove_column :reviews, :dish
  end

  def self.down
    add_column :reviews, :dish
  end
end

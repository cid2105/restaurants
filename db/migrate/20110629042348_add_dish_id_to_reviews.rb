class AddDishIdToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :dish_id, :integer
  end

  def self.down
    remove_column :reviews, :dish_id
  end
end

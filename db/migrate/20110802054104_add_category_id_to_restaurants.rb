class AddCategoryIdToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :category_id, :integer
  end

  def self.down
    remove_column :restaurants, :category_id
  end
end

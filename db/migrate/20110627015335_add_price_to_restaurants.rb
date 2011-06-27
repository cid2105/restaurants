class AddPriceToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :price, :float
  end

  def self.down
    remove_column :restaurants, :price
  end
end

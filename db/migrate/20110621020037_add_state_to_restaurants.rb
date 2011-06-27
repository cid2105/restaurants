class AddStateToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :state, :string
  end

  def self.down
    remove_column :restaurants, :state
  end
end

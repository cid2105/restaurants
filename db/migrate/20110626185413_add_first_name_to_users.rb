class AddFirstNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :name, :string
    add_column :users, :url, :string
    add_column :users, :pic, :string
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :name
    remove_column :users, :url
    remove_column :users, :pic
  end
end

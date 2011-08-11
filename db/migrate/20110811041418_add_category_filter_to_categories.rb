class AddCategoryFilterToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :category_filter, :string
  end

  def self.down
    remove_column :categories, :category_filter
  end
end

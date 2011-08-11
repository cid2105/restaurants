class AddReviewIdToDishes < ActiveRecord::Migration
  def self.up
    add_column :dishes, :review_id, :integer
  end

  def self.down
    remove_column :dishes, :review_id
  end
end

class AddVotedOnReviewToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :voted_on_review, :integer
  end

  def self.down
    remove_column :users, :voted_on_review
  end
end

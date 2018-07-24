class AddDefaultToUpvotesDownvotes < ActiveRecord::Migration[5.1]
  def change
    change_column :tools, :upvotes, :integer, default: 0, null: false
    change_column :tools, :downvotes, :integer, default: 0, null: false
  end
end

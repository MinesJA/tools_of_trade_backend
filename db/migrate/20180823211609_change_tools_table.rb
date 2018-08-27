class ChangeToolsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :tools, :user_id
  end
end

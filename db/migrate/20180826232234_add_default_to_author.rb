class AddDefaultToAuthor < ActiveRecord::Migration[5.2]
  def change
    change_column :user_tools, :author, :boolean, default: 0, null: false
  end
end

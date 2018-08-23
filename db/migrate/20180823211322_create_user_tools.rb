class CreateUserTools < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tools do |t|
      t.integer :tool_id
      t.integer :user_id
      t.boolean :author

      t.timestamps
    end
  end
end

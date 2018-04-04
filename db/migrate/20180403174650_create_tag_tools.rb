class CreateTagTools < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_tools do |t|
      t.integer :tag_id
      t.integer :tool_id

      t.timestamps
    end
  end
end

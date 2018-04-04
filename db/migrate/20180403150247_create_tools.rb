class CreateTools < ActiveRecord::Migration[5.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :upvotes
      t.integer :downvotes
      t.integer :user_id

      t.timestamps
    end
  end
end

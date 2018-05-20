class CreateTools < ActiveRecord::Migration[5.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :admin_id
      t.integer :room_id
      t.string :title
      t.text :content
      t.timestamps
    end

    add_foreign_key :posts, :admins, column: :admin_id
    add_index :posts, :admin_id
    add_foreign_key :posts, :rooms, column: :room_id
    add_index :posts, :room_id
  end
end

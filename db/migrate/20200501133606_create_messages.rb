class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :admin_id
      t.integer :room_id
      t.timestamps
    end
    add_foreign_key :messages, :admins, column: :admin_id
    add_index :messages, :admin_id
    add_foreign_key :messages, :rooms, column: :room_id
    add_index :messages, :room_id
  end
end

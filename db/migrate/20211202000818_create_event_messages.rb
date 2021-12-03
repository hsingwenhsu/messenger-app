class CreateEventMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :event_messages do |t|
      t.text :content
      t.integer :admin_id
      t.integer :event_id
      t.timestamps
    end
    add_foreign_key :event_messages, :admins, column: :admin_id
    add_index :event_messages, :admin_id
    add_foreign_key :event_messages, :events, column: :event_id
    add_index :event_messages, :event_id
  end
end

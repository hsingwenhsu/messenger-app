class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :admin_id
      t.integer :event_id
      t.timestamps
    end
    add_foreign_key :attendances, :admins, column: :admin_id
    add_index :attendances, :admin_id
    add_foreign_key :attendances, :events, column: :event_id
    add_index :attendances, :event_id
  end
end

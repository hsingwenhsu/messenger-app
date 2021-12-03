class AddRoomIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :room_id, :integer
    add_foreign_key :events, :rooms, column: :room_id
    add_index :events, :room_id
  end
end

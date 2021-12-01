class AddColumnsToPrivateMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :private_messages, :content, :string
    add_column :private_messages, :private_room_id, :integer
    add_column :private_messages, :admin_id, :integer
  end
end

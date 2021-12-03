class ModifyPrivateMessageColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :private_messages, :private_room_id, :private_id
  end
end

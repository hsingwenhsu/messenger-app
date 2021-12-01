class AddForeignKeyToPrivateMessage < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :private_messages, :privates, column: :private_room_id
    add_foreign_key :private_messages, :admins, column: :admin_id
  end
end

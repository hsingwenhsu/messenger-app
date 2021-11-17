class RemoveFieldNameFromMessage < ActiveRecord::Migration[6.0]
  def change

    remove_column :messages, :admin_id, :integer
  end
end

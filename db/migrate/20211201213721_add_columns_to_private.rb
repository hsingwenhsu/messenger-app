class AddColumnsToPrivate < ActiveRecord::Migration[6.0]
  def change
    add_column :privates, :admin_id1, :string
    add_column :privates, :admin_id2, :string
  end
end

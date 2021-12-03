class AddColumnToPrivate < ActiveRecord::Migration[6.0]
  def change
    add_column :privates, :admin_name1, :string
    add_column :privates, :admin_name2, :string
  end
end

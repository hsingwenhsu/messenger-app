class CreatePrivates < ActiveRecord::Migration[6.0]
  def change
    create_table :privates do |t|
      t.integer :admin_id1
      t.integer :admin_id2

      t.timestamps
    end
  end
end

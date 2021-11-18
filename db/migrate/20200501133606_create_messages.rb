class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      #t.references :admin, null: false, foreign_key: true
      #t.references :room, null: false, foreign_key: true
      # t.references :admin, foreign_key: true
      # t.references :room, foreign_key: true
      
      t.integer :admin_id
      t.integer :room_id
      t.timestamps
    end
    add_index :messages, :admin_id
    add_index :messages, :room_id
  end
end

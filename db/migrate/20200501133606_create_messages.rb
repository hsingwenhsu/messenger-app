class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      #t.references :admin, null: false, foreign_key: true
      #t.references :room, null: false, foreign_key: true
      t.references :admin, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end

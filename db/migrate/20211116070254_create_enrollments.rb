class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      # t.references :admin, null: false, n_key: true
      #t.references :room, null: false, foreign_key: true
      t.integer :admin_id
      t.integer :room_id
      t.timestamps
    end
    add_foreign_key :enrollments, :admins, column: :admin_id
    add_index :enrollments, :admin_id
    add_foreign_key :enrollments, :rooms, column: :room_id
    add_index :enrollments, :room_id
  end
end

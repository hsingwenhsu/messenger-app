class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end

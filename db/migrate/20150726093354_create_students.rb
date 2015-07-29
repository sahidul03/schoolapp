class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.string :address
      t.string :father_name
      t.string :mother_name
      t.string :guardian_name
      t.string :guardian_contact_no
      t.string :profile_photo
      t.integer :roll_no

      t.references :level, index: true

      t.timestamps null: false
    end
  end
end

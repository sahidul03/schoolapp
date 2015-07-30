class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :qualification
      t.string :designation
      t.string :profile_photo
      t.string :gender

      t.timestamps null: false
    end
  end
end

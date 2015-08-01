class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :designation
      t.string :profile_photo
      t.string :gender
      t.text :message

      t.timestamps null: false
    end
  end
end

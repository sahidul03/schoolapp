class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :title
      t.text :body
      t.string :file

      t.timestamps null: false
    end
  end
end

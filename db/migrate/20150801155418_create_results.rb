class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :title
      t.text :body
      t.string :file

      t.references :level, index: true

      t.timestamps null: false
    end
  end
end

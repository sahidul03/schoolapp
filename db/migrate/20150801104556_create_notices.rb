class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.string :body
      t.string :image

      t.timestamps null: false
    end
  end
end

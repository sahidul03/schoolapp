class CreateIndexSliders < ActiveRecord::Migration
  def change
    create_table :index_sliders do |t|
      t.string :title
      t.string :image

      t.timestamps null: false
    end
  end
end

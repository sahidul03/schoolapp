class AddHeadToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :head, :string
  end
end

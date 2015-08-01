class AddMessageToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :message, :text
  end
end

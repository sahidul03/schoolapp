class AddMessageToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :message, :string
  end
end

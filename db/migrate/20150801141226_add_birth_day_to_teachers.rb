class AddBirthDayToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :birth_day, :date
  end
end

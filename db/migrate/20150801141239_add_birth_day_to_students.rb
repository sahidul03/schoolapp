class AddBirthDayToStudents < ActiveRecord::Migration
  def change
    add_column :students, :birth_day, :date
  end
end

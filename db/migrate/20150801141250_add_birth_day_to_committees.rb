class AddBirthDayToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :birth_day, :date
  end
end

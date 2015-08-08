class AddIsAcceptedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :is_accepted, :boolean, :default => false
  end
end

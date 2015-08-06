class AddHeadToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :head, :string
  end
end

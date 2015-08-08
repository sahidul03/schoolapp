class AddHeadToSpeechess < ActiveRecord::Migration
  def change
    add_column :speeches, :head, :string
  end
end

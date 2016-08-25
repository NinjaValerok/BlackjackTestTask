class AddStandToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :stand, :boolean
  end
end

class AddRoundToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :round, :integer, default: 0
  end
end

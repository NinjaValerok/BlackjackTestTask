class AddStatusToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :status, :string, default: Game::STATUS[0]
  end
end

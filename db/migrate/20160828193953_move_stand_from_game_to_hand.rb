class MoveStandFromGameToHand < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :stand, :boolean
    add_column :hands, :stand_status, :boolean
  end
end

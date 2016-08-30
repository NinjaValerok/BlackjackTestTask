class RemoveStandFromGameAndAddStatusToHand < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :stand, :boolean
    add_column :hands, :status, :string, default: Hand::STATUS[0]
  end
end

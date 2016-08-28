class AddUserToHand < ActiveRecord::Migration[5.0]
  def change
    add_column :hands, :user_id, :integer, index: true
  end
end

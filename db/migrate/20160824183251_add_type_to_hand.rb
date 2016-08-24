class AddTypeToHand < ActiveRecord::Migration[5.0]
  def change
    add_column :hands, :type_name, :string
  end
end

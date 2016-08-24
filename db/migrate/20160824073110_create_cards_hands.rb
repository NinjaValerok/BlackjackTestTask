class CreateCardsHands < ActiveRecord::Migration[5.0]
  def change
    create_table :cards_hands, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :hand, index: true
    end
  end
end

class AddTimestampsToCardsDecks < ActiveRecord::Migration[5.0]
  def change
    add_column(:cards_decks, :created_at, :datetime)
    add_column(:cards_decks, :updated_at, :datetime)
  end
end

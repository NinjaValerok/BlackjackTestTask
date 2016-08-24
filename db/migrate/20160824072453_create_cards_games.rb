class CreateCardsGames < ActiveRecord::Migration[5.0]
  def change
    create_table :cards_games, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :game, index: true
    end

  end
end

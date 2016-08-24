class Hand < ApplicationRecord
  has_and_belongs_to_many :cards
  belongs_to :game, optional: true

  def hit
    cards << game.deck.take_card
  end

  def score
    cards.sum(:value)
  end

  def play_dealer
    if score < 17
      hit
      play
    end
  end
end

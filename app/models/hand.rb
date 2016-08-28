class Hand < ApplicationRecord
  has_and_belongs_to_many :cards
  belongs_to :game, optional: true
  belongs_to :user, optional: true

  def hit
    cards << game.deck.take_card
  end

  def stand
    update_column(:stand_status, true)
  end

  def score
    cards.sum(:value)
  end

  def play_dealer
    if score < 17
      hit
      play_dealer
    end
  end
end

class Deck < ApplicationRecord
  belongs_to :game, optional: true
  has_and_belongs_to_many :cards

  after_create :add_and_shuffle_cards

  def take_card
    card = cards.order("created_at DESC").last
    cards.delete(card.id)
    card
  end


  def add_and_shuffle_cards
    cards << Card.all.order('random()')
  end
end

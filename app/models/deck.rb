class Deck < ApplicationRecord
  belongs_to :game, optional: true
  has_and_belongs_to_many :cards

  after_create :add_and_shuffle_cards

  private

  def add_and_shuffle_cards
    cards << Card.all
  end
end

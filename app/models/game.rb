class Game < ApplicationRecord
  has_many :hands
  has_one :deck

  def hit
    player_hand.hit
  end

  def player_hand
    hands.find_by(type_name: 'Player')
  end

  def dealer_hand
    hands.find_by(type_name: 'Dealer')
  end
end

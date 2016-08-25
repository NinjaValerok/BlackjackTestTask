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

  def find_winner
    return 'Player' if player_hand.score > 21
    return 'Dealer' if dealer_hand.score > 21
    if player_hand.score == dealer_hand.score
      'Push'
    elsif player_hand.score > dealer_hand.score
      'Player'
    else
      'Dealer'
    end
  end

  def push
    hands.find_each do |hand|
      hand.cards.delete_all
    end
  end
end
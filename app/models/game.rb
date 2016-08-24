class Game < ApplicationRecord
  has_many :hands
  has_one :deck

  def hit
    player_hand.hit
  end

  def stand
    dealer_hand.play
    # @winner = determine_winner(@player_hand.value, @dealer_hand.value)
  end

  def player_hand
    hands.find {|h| h.instance_of? Hand}
  end

  def dealer_hand
    hands.find {|h| h.instance_of? DealerHand}
  end
end

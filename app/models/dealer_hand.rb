class Dealer_hand < Hand
  def play
    if score < 17
      hit
      play
    end
  end
end
class Game < ApplicationRecord
  has_many :hands
  has_one :deck

  after_create :create_deck
  after_create :create_dealer


  def add_user(user)
    unless hands.exists?(user_id: user.id)
      hand = Hand.create(type_name: 'Player', user_id: user.id)
      hands << hand
      2.times { hit_hand hand }
    end

  end

  def players
    hands.where(type_name: 'Player')
  end

  def hit_user(user)
    create_new_deck_if_need
    player_hand(user).hit
  end

  def hit_hand(hand)
    create_new_deck_if_need
    hand.hit
  end

  def play_dealer
    create_new_deck_if_need
    dealer_hand.play_dealer unless players_with_score_less_22.empty?
  end

  def player_hand(user)
    hands.find_by(user_id: user.id, type_name: 'Player')
  end

  def dealer_hand
    hands.find_by(type_name: 'Dealer')
  end

  def hit_dealer
    create_new_deck_if_need
    dealer_hand.hit
  end

  def players_with_score_less_22
    players.to_a.map { |player| player if player.score < 22 }
  end


  def find_winner
    players = players_with_score_less_22
    return dealer_hand if players.empty?
    max_player_hand = players.max{ |p1, p2| p1.score >= p2.score }
    return max_player_hand if dealer_hand.score > 21
    return max_player_hand if max_player_hand.score > dealer_hand.score
  end

  def push
    create_new_deck_if_need
    hands.find_each do |hand|
      hand.cards.delete_all
    end
    2.times {
      hit_dealer
      players.each {|h| hit_hand(h)}
    }
  end


  def create_new_deck_if_need
    create_deck if deck.cards.size == 0
  end

  private

  def create_dealer
    dealer = Hand.create(type_name: 'Dealer')
    hands << dealer
    2.times { dealer.hit }
  end

end
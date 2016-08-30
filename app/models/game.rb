class Game < ApplicationRecord
  has_many :hands, dependent: :destroy
  has_one :deck, dependent: :destroy
  belongs_to :winner, class_name: User, optional: true

  STATUS = ['Идет', 'Подебил дилер', 'Победил игрок']

  after_create :create_deck
  after_create :create_dealer


  def add_user(user)
    unless hands.exists?(user_id: user.id)
      hand = Hand.create(type_name: 'Player', user_id: user.id)
      hands << hand
      2.times { hit_hand hand }
    end

  end

  def players_hands
    hands.where(type_name: 'Player')
  end

  def hit_hand(hand)
    create_new_deck_if_need
    message = hand.hit
    stop
    message
  end

  def hit_user(user)
    hit_hand(player_hand(user))
  end

  def play_dealer
    create_new_deck_if_need
    dealer_hand.play_dealer unless players_hands_with_score_less_22.empty?
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

  def players_hands_with_score_less_22
    players_hands.map { |player| player if player.score < 22 }
  end


  def stop
    if can_find_winner?
      play_dealer
      winner = find_winner
      if winner
        if winner.type_name == 'Player'
          update_column(:winner_id, winner.user.id) if winner
          update_column(:status, STATUS[2])
        else
          update_column(:status, STATUS[1])
        end
      else
        push
      end
    end
  end

  def can_find_winner?
    !players_hands.exists?(status: Hand::STATUS[0]) || players_hands_with_score_less_22.empty?
  end

  # return nil if need push
  def find_winner
    _players_hands = players_hands_with_score_less_22
    if _players_hands.empty? || _players_hands.all?(&:blank?)
      update_column(:status, STATUS[1])
      return dealer_hand
    else
      player_max_score = _players_hands.max{ |p1, p2| p1.score <=> p2.score }.score
      return dealer_hand if dealer_hand.score > player_max_score && dealer_hand.score < 22
      players_hands.each {|hand| hand.update_column(:status, Hand::STATUS[3]) if hand.score < player_max_score }
      winners = players_hands.map {|h| h if h.score == player_max_score}
      if winners.size == 1
        winners[0]
      else
        nil
      end
    end
  end

  def push
    create_new_deck_if_need
    hands.find_each(:status, Hand::STATUS[0]) do |hand|
      hand.cards.delete_all
    end
    2.times {
      hit_dealer
      players_hands.each {|h| hit_hand(h)}
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
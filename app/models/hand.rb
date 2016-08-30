class Hand < ApplicationRecord
  STATUS = ['play', 'stand', 'out', 'loose'].freeze
  has_and_belongs_to_many :cards
  belongs_to :game, optional: true
  belongs_to :user, optional: true

  # not good, need refactoring
  def hit
    if status == STATUS[0]
      case score
        when 0..19
          cards << game.deck.take_card
          if score == 21
            update_column(:status, STATUS[1])
            'Black Jack'
          elsif score > 21
            update_column(:status, STATUS[2])
            'You out'
          else
            'New card is tacked'
          end
        when 21
          'Ypu already have a Black Jack! Dont need for more cards!'
        else
          'Cant hit, score more than 21'
      end
    else
      "You cant hit, status is #{status}"
    end
  end

  def stand
    update_column(:status, STATUS[1])
  end

  def out
    update_column(:status, STATUS[2])
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

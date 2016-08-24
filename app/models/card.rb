class Card < ApplicationRecord
  has_and_belongs_to_many :games
  has_and_belongs_to_many :hands # that bad :(


  class << self
    def create_cards
      [:clubs, :diamonds, :spades, :hearts].each do |suit|
        
        (2..10).each do |number|
          create(suit: suit, value: number, name: number.to_s)
        end
        
        ['J', 'Q', 'K'].each do |name|
          create(suit: suit, value: 10, name: name)
        end
        
        create(suit: suit, value: 11, name: 'A')
      end
    end
  end
end

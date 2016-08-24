class Game < ApplicationRecord
  has_many :hands
  has_one :deck
end

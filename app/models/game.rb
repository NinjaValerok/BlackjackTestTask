class Game < ApplicationRecord
  has_many :hands
  has_and_belongs_to_many :cards
end

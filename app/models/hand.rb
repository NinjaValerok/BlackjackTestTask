class Hand < ApplicationRecord
  has_and_belongs_to_many :cards
  belongs_to :game, optional: true
end

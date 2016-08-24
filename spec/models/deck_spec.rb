require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject { Deck.create }
  it { should respond_to(:game) }
  it { should respond_to(:cards) }

  context 'when new' do
    it 'should have 52 cards' do
      expect(subject.cards.size).to eq 52
    end
  end




end

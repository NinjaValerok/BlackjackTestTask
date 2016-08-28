require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { Game.create }

  it { should respond_to(:deck) }
  it { should respond_to(:round) }

  context 'when create' do
    it 'should have a deck with 52 cards' do
      expect(subject.deck.cards.size).to eq 52
    end

    it 'should have a dealer' do
      expect(subject.dealer_hand).to be_instance_of(Hand)
    end
  end

  describe '#hit' do
    subject { Game.create.hit }
  end
end

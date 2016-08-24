require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject { Deck.create }
  it { should respond_to(:game) }
  it { should respond_to(:cards) }
  it { should respond_to(:take_card) }

  context 'when new' do
    it 'should have 52 cards' do
      expect(subject.cards.size).to eq 52
    end
  end

  describe '#take_card' do
    let(:deck) { Deck.create }
    subject { deck.take_card }
    it 'should reduce size of cards in deck' do
       expect { subject }.to change{ deck.cards.size }.by(-1)
    end
  end




end

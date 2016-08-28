require 'rails_helper'

RSpec.describe Hand, type: :model do
  subject { Hand.new }

  it { should respond_to(:cards) }
  it { should respond_to(:game) }
  it { should respond_to(:hit) }
  it { should respond_to(:user) }

  describe '#hit' do
    #need move to factory
    let(:hand) do
      game = Game.create
      game.create_deck
      game.hands << Hand.create(type_name: 'Player')
      game.player_hand
    end
    subject { hand.hit }

    it 'should increase cards number' do
      expect{ subject }.to change(hand.cards, :size).by(1)
    end
  end


end

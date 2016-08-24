require 'rails_helper'

RSpec.describe Hand, type: :model do
  subject { Hand.new }

  it { should respond_to(:cards) }
  it { should respond_to(:game) }
  it { should respond_to(:hit) }

  describe '#hit' do
    let(:hand) { Hand.create }
    subject { hand.hit }

    it 'should increase cards number' do
      expect{ subject }.to change(hand.cards, :size).by(1)
    end
  end


end

require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { Game.create }

  it { should respond_to(:deck) }
  it { should respond_to(:round) }
  it { should_not respond_to(:stand) }

  context 'when create' do
    it 'should have a deck with 50 cards(2 belongs to dealer)' do
      expect(subject.deck.cards.size).to eq 50
    end

    it 'should have a dealer' do
      expect(subject.dealer_hand).to be_instance_of(Hand)
    end

    it 'dealer should have 2 cards' do
      expect(subject.dealer_hand.cards.size).to eq 2
    end

  end

  # describe '#hit' do
  #   let(:game) { create(:game) }
  #   subject { game.hit }
  #
  #   context 'have 3 players' do
  #     before do
  #       3.times do
  #         game.hands << create(:hand)
  #       end
  #
  #     end
  #   end
  # end
  #
  # describe '#find winner' do
  #   let(:game) { create(:game) }
  #
  #   context 'have 2 players' do
  #     let(:user1) { create(:user) }
  #     let(:user2) { create(:user) }
  #     before do
  #       game.hands << create(:hand, user: user1) << create(:hand, user: user2)
  #       game.players.each do |p|
  #         p.hit
  #         p.stand
  #       end
  #       game.play_dealer
  #     end
  #
  #     it 'find the best score hand' do
  #
  #     end
  #   end
  # end

end

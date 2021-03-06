require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '.Create_cards' do
    context '#create_cards' do
      it 'should create 52 cards' do
        Card.delete_all
        Card.create_cards
        expect(Card.all.size).to eq 52
      end
    end
  end
end

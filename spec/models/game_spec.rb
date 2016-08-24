require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { Game.new }

  it { should respond_to(:deck) }

  # it 'should have 2 hands' do
  #   expect(subject.hands.size).to eq 2
  # end
end

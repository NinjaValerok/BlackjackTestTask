require 'rails_helper'

RSpec.describe Hand, type: :model do
  subject { create(:hand) }

  it { should respond_to(:cards) }
  it { should respond_to(:game) }
  it { should respond_to(:hit) }
  it { should respond_to(:user) }
  it { should respond_to(:stand) }
  it { should respond_to(:stand_status) }

  context 'after create' do
    it 'have stand_status - false' do
      expect(subject.stand_status).to be_falsey
    end

    it 'have user' do
      expect(subject.user).to be_truthy
    end
  end

  describe '#stand' do
    let(:hand) {create(:hand)}
    subject { hand.stand }

    it 'should change stand_status to false' do
      expect{ subject }.to change(hand, :stand_status).to true
    end
  end

end

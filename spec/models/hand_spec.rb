require 'rails_helper'

RSpec.describe Hand, type: :model do
  subject { create(:hand) }

  it { should respond_to(:cards) }
  it { should respond_to(:game) }
  it { should respond_to(:hit) }
  it { should respond_to(:user) }
  it { should respond_to(:stand) }
  it { should respond_to(:status) }

  context 'after create' do
    # it "have status - #{Hand::STATUS[0]}" do
    #   expect(subject.status).to eq Hand::STATUS[0]
    # end

    it 'have user' do
      expect(subject.user).to be_truthy
    end
  end

  describe '#stand' do
    let(:hand) {create(:hand)}
    subject { hand.stand }

    it 'should change status to stand' do
      expect{ subject }.to change(hand, :status).to Hand::STATUS[1]
    end
  end

end

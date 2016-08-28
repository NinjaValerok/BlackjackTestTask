require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'factory' do
    context 'when no arguments' do
      subject { create(:user) }
      it { should be_valid }
    end
  end

end

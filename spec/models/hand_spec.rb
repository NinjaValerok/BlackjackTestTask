require 'rails_helper'

RSpec.describe Hand, type: :model do
  subject { Hand.new }

  it { should respond_to(:cards) }
  it { should respond_to(:game) }


end

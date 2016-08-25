require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { Game.new }

  it { should respond_to(:deck) }
end

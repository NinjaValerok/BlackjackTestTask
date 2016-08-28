FactoryGirl.define do
  factory :hand do
    type_name 'Player'
    after(:create) do |hand|
      hand.update_column(:user_id, create(:user).id) unless hand.user
      hand.update_column(:game_id, create(:game).id) unless hand.game
    end
  end
end
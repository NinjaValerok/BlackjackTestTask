FactoryGirl.define do
  factory :hand do
    after(:create) do |hand|
      hand.update_column(:user_id, create(:user).id) unless hand.user
    end
  end
end
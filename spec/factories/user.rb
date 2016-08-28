FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }
  factory :user do
    email
    password "foobarfoobar"
    password_confirmation "foobarfoobar"
  end
end
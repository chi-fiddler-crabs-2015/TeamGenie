FactoryGirl.define do
  factory :user do
    first_name Faker::Lorem.characters(10)
    last_name Faker::Lorem.characters(10)
    email Faker::Internet.email
    password "abcdefgh12038091823098"
    username Faker::Lorem.characters(10)
    birthday Faker::Date.backward(10)

  end

end

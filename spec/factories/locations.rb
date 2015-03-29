FactoryGirl.define do
  factory :location do
    name Faker::Lorem.characters(10)
    address Faker::Lorem.characters(10)
    city Faker::Lorem.characters(8)
    state "IL"
    zip_code "60608"
    directions Faker::Lorem.characters(30)
  end

end
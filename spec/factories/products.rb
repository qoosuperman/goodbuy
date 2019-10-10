FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    price { Faker::Number.between(from: 10, to: 100) }
  end
end
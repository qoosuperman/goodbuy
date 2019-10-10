FactoryBot.define do
  factory :option do
    name { Faker::Food.dish }
    price { Faker::Number.between(from: 10, to: 20) }
  end
end
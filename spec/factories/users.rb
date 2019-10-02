FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nick_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6) }

    trait :invalid do
      phone { nil }
      address { nil }
    end
  end
end
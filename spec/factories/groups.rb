FactoryBot.define do
  factory :group do
    title { Faker::Name.name }
    association :user

  end
end
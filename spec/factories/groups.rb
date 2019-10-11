FactoryBot.define do
  factory :group do
    title { Faker::Name.name }
    association :user

    trait :public do
      is_public { true }
      after(:create) do |group, evaluator|
        create_list(:product, 2, group: group)
        create_list(:option, 2, group: group)
      end
    end
  end
end
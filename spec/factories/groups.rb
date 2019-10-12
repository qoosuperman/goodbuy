FactoryBot.define do
  factory :group do
    title { Faker::Name.name }
    association :user

    factory :group_with_option_and_product do
      after(:create) do |group, evaluator|
        create(:product, name: "紅茶", price: 20, group: group)
        create(:option, name: "加椰果", price: 10, group: group)
      end
    end

    factory :group_with_options_and_products do
      after(:create) do |group, evaluator|
        create_list(:product, 2, group: group)
        create_list(:option, 2, group: group)
      end
    end

  end
end
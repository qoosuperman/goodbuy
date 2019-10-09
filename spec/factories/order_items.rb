FactoryBot.define do
  factory :order_item do
    association :order
    association :product

    trait :with_option do
      after(:build) { options = build_list(:option, 2) }
      after(:build) {|order_item| order_item.options = options }
    end
  end
end
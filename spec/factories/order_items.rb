FactoryBot.define do
  factory :order_item do
    association :order
    association :product

    trait :with_option do
      after(:build) {|order_item| order_item.options << build_list(:option, 2) }
    end
  end
end
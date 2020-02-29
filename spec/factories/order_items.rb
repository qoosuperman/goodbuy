# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  order_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#

FactoryBot.define do
  factory :order_item do
    association :order
    association :product

    trait :with_option do
      after(:build) { |order_item| order_item.options << build_list(:option, 2) }
    end
  end
end

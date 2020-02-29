# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    price { Faker::Number.between(from: 10, to: 100) }
  end
end

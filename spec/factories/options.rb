# == Schema Information
#
# Table name: options
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :option do
    name { Faker::Food.dish }
    price { Faker::Number.between(from: 10, to: 20) }
  end
end

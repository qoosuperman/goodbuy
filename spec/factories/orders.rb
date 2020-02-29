# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  buyer_id   :integer
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trade_no   :string
#

FactoryBot.define do
  factory :order do
    group
    association :buyer, factory: :user
  end
end

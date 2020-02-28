# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :follow do
    user { nil }
    group { nil }
  end
end

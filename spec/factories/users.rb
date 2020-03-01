# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  nick_name              :string           default(""), not null
#  bank_account           :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fb_uid                 :string
#  fb_token               :string
#  google_uid             :string
#  google_token           :string
#  follow_id              :bigint
#

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nick_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6) }

    trait :invalid do
      name { nil }
    end
  end
end

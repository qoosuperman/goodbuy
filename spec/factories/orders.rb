
FactoryBot.define do
  factory :order do
    group
    association :buyer, factory: :user
  end
end


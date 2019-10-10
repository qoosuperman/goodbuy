require 'rails_helper'

RSpec.describe Group, type: :model do
  context "factorybot data" do
    it "做出 group 是有效的" do
      g1 = build(:group)
      expect(g1.valid?).to be true
    end
  end

  context "total_price function" do
    it "可以計算總金額" do
      g1 = build(:group)
      o1 = build(:order)
      o2 = build(:order)
      g1.orders = [o1, o2]
      expect(g1.total_price).to be (o1.total_price + o2.total_price)
    end
  end

end
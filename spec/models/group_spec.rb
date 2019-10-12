require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group1) { build(:group) }
  let(:order1) { build(:order) }
  let(:order2) { build(:order) }

  context "factorybot data" do
    it "做出 group 是有效的" do
      expect(group1.valid?).to be true
    end
  end

  context "total_price function" do
    it "可以計算總金額" do
      group1.orders = [order1, order2]
      expect(group1.total_price).to be (order1.total_price + order2.total_price)
    end
  end

end
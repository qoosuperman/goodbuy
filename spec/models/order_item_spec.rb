require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context "factorybot data" do
    it "做出 order_item 是有效的" do
      oi1 = build(:order)
      expect(oi1.valid?).to be true
    end
  end

  context "total_price function" do
    it "可以計算總金額" do
      oi1 = build(:order_item)
      o1 = build(:option, price: 20)
      o2 = build(:option, price: 10)

      oi1.options = [o1, o2]
      expect(oi1.total_price).to be(oi1.product.price + 30 )
    end
  end


end
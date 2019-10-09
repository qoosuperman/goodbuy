require 'rails_helper'

RSpec.describe Order, type: :model do
  context "factorybot data" do
    it "做出 order 是有效的" do
      o1 = build(:order)
      expect(o1.valid?).to be true
    end
  end

  context "total_price function" do
    it "可以計算產品總金額" do 
      o1 = build(:order)
      oi1 = build(:order_item)
      oi2 = build(:order_item)
      o1.order_items = [oi1, oi2]
      
      expect(o1.total_price).to be(oi1.total_price + oi2.total_price)
    end

    it "可以計算產品跟選項總金額" do 
      o1 = build(:order)
      oi1 = build(:order_item, :with_option)
      oi2 = build(:order_item, :with_option)
      o1.order_items = [oi1, oi2]
      
      expect(o1.total_price).to be(oi1.total_price + oi2.total_price)
    end
  end


end
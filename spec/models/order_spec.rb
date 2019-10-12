require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order1) { build(:order) }
  let(:order_item1) { build(:order_item) }
  let(:order_item2) { build(:order_item) }
  let(:order_item1_with_opt) { build(:order_item, :with_option) }
  let(:order_item2_with_opt) { build(:order_item, :with_option) }

  context "factorybot data" do
    it "做出 order 是有效的" do
      expect(order1.valid?).to be true
    end
  end

  context "total_price function" do
    it "可以計算產品總金額" do 
      order1.order_items = [order_item1, order_item2]
      expect(order1.total_price).to be(order_item1.total_price + order_item2.total_price)
    end

    it "可以計算產品跟選項總金額" do 
      order1.order_items = [order_item1_with_opt, order_item2_with_opt]
      expect(order1.total_price).to be(order_item1_with_opt.total_price + order_item2_with_opt.total_price)
    end
  end


end
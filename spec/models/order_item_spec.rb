require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order_item1) { build(:order_item) }
  let(:option1) { build(:option, price: 20) }
  let(:option2) { build(:option, price: 10) }

  context "factorybot data" do
    it "做出 order_item 是有效的" do
      expect(order_item1.valid?).to be true
    end
  end

  context "total_price function" do
    it "可以計算總金額" do
      order_item1.options = [option1, option2]
      expect(order_item1.total_price).to be(order_item1.product.price + 30 )
    end
  end


end
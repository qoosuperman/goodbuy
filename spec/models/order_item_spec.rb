# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  order_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order_item) { build(:order_item) }
  let(:product) { order_item.product }
  let(:option1) { build(:option, price: 20) }
  let(:option2) { build(:option, price: 10) }

  describe 'factorybot data' do
    it 'should be valid' do
      expect(order_item).to be_valid
    end
  end

  describe '#item_name' do
    before do
      order_item.options = [option1, option2]
    end

    let(:product_string) { "#{product.name}(#{product.price}元)" }
    let(:options) do
      [
        "#{option1.name} (+#{option1.price}元)",
        "#{option2.name} (+#{option2.price}元)"
      ].join(' ')
    end

    subject { order_item.item_name }

    it do
      expect(subject).to eq("#{product_string} #{options}")
    end
  end

  describe '#total_price' do
    before do
      order_item.options = [option1, option2]
    end

    it "可以計算總金額" do
      expect(order_item.total_price).to be(order_item.product.price + option1.price + option2.price)
    end
  end
end

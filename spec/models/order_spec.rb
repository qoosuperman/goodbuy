# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  buyer_id   :integer
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trade_no   :string
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order1) { build(:order) }
  let(:order_item1) { build(:order_item) }
  let(:order_item2) { build(:order_item) }
  let(:order_item1_with_opt) { build(:order_item, :with_option) }
  let(:order_item2_with_opt) { build(:order_item, :with_option) }

  describe 'factorybot data should be valid' do
    it { expect(order1).to be_valid }
  end

  describe '#total_price' do
    it '可以計算產品總金額' do
      order1.order_items = [order_item1, order_item2]
      expect(order1.total_price).to be(order_item1.total_price + order_item2.total_price)
    end

    it '可以計算產品跟選項總金額' do
      order1.order_items = [order_item1_with_opt, order_item2_with_opt]
      expect(order1.total_price).to be(order_item1_with_opt.total_price + order_item2_with_opt.total_price)
    end
  end

  describe '#item_name' do
    let(:item_name) { 'name' }
    before do
      allow_any_instance_of(OrderItem).to receive(:item_name).and_return(item_name)
    end

    it do
      order1.order_items = [order_item1, order_item2]
      expect(order1.item_name).to eq('name#name')
    end
  end
end

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

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_many :option_order_item_logs
  has_many :options, through: :option_order_item_logs

  def item_name
    options_arr = options.map do |option|
      "#{option['name']} (+#{option['price']}元)"
    end.join(' ')
    "#{product['name']}(#{product['price']}元) #{options_arr}"
  end

  def total_price
    options_money = options.reduce(0) do |acc, option|
      acc + option['price']
    end
    product.price + options_money
  end
end

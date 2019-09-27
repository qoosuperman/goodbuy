class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_many :option_order_item_logs
  has_many :options, through: :option_order_item_logs

  def item_name
    options_arr = options.map{ |option|
      "#{option["name"]} (+#{option["price"]}元) "
    }.join(" ")
    "#{product["name"]}(#{product["price"]}元) #{options_arr}"
  end

  def total_price
    options_money = options.reduce(0) { |acc, option|
      acc + option["price"]
    }
    product.price + options_money
  end
end

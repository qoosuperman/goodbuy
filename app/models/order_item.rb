class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_many :option_order_item_logs
  has_many :options, through: :option_order_item_logs

  def item_name
    options_arr = options.map{ |option|
      "#{option["name"]} (+#{option["price"]}元) "
    }
    "#{product["name"]} #{options_arr}"
  end
end

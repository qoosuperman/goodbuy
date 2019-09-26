class Order < ApplicationRecord
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  belongs_to :group
  has_many :order_items

  def total_price
    order_items.reduce(0) {|acc, order_item|

      options_money = order_item.options.reduce(0) { |acc2, option|
        acc2 + option["price"]
      }

      acc + order_item.product.price + options_money
    }
  end

  def item_name
    order_items.map{ |order_item|
      order_item.item_name
  }.join('#')
  end

end

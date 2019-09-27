class Order < ApplicationRecord
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  belongs_to :group
  has_many :order_items

  def total_price
    order_items.reduce(0) {|acc, order_item|
      acc + order_item.total_price
    }
  end

  def item_name
    order_items.map{ |order_item|
      order_item.item_name
  }.join('#')
  end

end

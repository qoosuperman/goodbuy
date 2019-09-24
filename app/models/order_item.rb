class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_many :options, through: :option_order_item_log

end

class Option < ApplicationRecord
  belongs_to :group
  has_many :order_items, through: :option_order_item_log
end

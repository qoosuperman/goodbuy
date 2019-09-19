class OptionOrderItemLog < ApplicationRecord
  belongs_to :option
  belongs_to :order_item
end

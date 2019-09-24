class Product < ApplicationRecord
  belongs_to :group
  has_one :order_item
end

class Product < ApplicationRecord
  belongs_to :group
  belongs_to :order_item
end

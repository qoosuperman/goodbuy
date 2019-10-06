class Product < ApplicationRecord
  belongs_to :group
  has_one :order_item
  validates :name, :price, presence: { message: "這欄必填喔！" }
end

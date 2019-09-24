class Order < ApplicationRecord
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  belongs_to :group
  has_many :order_items
end

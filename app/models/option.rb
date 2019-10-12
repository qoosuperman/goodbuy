class Option < ApplicationRecord
  belongs_to :group
  has_many :option_order_item_logs
  has_many :order_items, through: :option_order_item_logs
  validates :name, :price, presence: true
end

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  buyer_id   :integer
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trade_no   :string
#

class Order < ApplicationRecord
  belongs_to :buyer, foreign_key: 'buyer_id', class_name: 'User'
  belongs_to :group
  has_many :order_items

  def total_price
    order_items.reduce(0) do |acc, order_item|
      acc + order_item.total_price
    end
  end

  def item_name
    order_items.map(&:item_name).join('#')
  end
end

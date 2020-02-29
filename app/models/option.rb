# == Schema Information
#
# Table name: options
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Option < ApplicationRecord
  belongs_to :group
  has_many :option_order_item_logs
  has_many :order_items, through: :option_order_item_logs
  validates :name, :price, presence: true
end

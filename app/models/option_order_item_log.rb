# == Schema Information
#
# Table name: option_order_item_logs
#
#  id            :bigint           not null, primary key
#  option_id     :bigint
#  order_item_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class OptionOrderItemLog < ApplicationRecord
  belongs_to :option
  belongs_to :order_item
end

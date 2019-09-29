class RemoveColumnFromOptionOrderItemLog < ActiveRecord::Migration[5.2]
  def change
    remove_columns(:option_order_item_logs, :is_chosen)
  end
end

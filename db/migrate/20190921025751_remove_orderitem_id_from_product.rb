class RemoveOrderitemIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :order_item, index: true, foreign_key: true
  end
end

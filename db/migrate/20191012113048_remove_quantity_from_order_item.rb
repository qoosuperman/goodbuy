class RemoveQuantityFromOrderItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :quantity, :integer
  end
end

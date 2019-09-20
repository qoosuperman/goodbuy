class CreateOptionOrderItemLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :option_order_item_logs do |t|
      t.references :option, foreign_key: true
      t.references :order_item, foreign_key: true
      t.boolean :is_chosen

      t.timestamps
    end
  end
end

class AddTradeNoToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :trade_no, :string, unique: true
  end
end

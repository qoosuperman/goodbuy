class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :buyer_id 
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end

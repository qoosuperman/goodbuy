class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :group, foreign_key: true
      t.references :order_item, foreign_key: true

      t.timestamps
    end
  end
end

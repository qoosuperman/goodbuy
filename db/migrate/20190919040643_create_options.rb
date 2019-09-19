class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :name
      t.integer :price
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end

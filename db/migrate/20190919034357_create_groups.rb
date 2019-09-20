class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :phone
      t.boolean :is_active
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_public
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

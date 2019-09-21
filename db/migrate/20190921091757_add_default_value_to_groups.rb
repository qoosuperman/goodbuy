class AddDefaultValueToGroups < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:groups, :is_public, from: nil, to: false)
    change_column_default(:groups, :is_active, from: nil, to: true)
  end
end

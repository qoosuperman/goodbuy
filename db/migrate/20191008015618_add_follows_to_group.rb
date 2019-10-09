class AddFollowsToGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :follow, foreign_key: true
  end
end

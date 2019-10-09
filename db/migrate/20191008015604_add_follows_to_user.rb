class AddFollowsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :follow, foreign_key: true
  end
end

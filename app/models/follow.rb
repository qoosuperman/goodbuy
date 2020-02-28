# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validate :followed_group_valid

  private

  def followed_group_valid
    if Follow.where(user_id: user_id, group_id: group_id).exists?
      errors.add(:base, :cant_follow)
    end
  end
end

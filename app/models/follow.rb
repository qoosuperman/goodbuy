class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validate :followed_group_valid

  

  private
  def followed_group_valid
    if Follow.where(user_id:self.user_id, group_id: self.group_id).exists?
      errors.add(:base, :cant_follow)
    end
  end
end

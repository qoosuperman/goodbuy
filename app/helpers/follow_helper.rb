module FollowHelper
  def follow_btn(group)
    if group.follows.exists?(user_id: current_user.id)
      link_to "★", delete_follow_group_path(group.id), method: 'patch', remote: true, class: "btn btn-sm btn-white star-full"
    else
      link_to "★", follow_group_path(group.id), method: 'patch', remote: true, class: "btn btn-sm btn-white star-nil"
    end
  end
end

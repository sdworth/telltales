module FollowsHelper
  def show_follow(user)
    if user.id == current_user.id
      ''
    elsif Follow.find_by(user_id: current_user.id, user_followed_id: user.id)
      button_to 'following', follow_path(user), id: follow_path(user), class: 'button followed-button'
    else
      button_to 'following', follow_path(user), id: follow_path(user), class: 'button follow-button'
    end
  end
end
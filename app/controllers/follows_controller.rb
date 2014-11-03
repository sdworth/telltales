class FollowsController < ApplicationController
  def create
    @follow = Follow.new(
      user_id: current_user.id,
      user_followed_id: params[:id]
    )

    raise unless @follow.save

    render json: @follow
  end

  def destroy
    follow = Follow.find_by(user_id: current_user.id, user_followed_id: params[:id])

    raise unless follow.destroy

    render json: @follow
  end
end
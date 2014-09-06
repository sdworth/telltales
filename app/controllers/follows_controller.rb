class FollowsController < ApplicationController
  before_filter :require_authentication!

  def create
    @follow = Follow.new(
      user_id: @user.id,
      user_followed_id: params[:user_followed_id]
    )
    raise unless @follow.save

    respond_to do |format|
      format.json { render json: @follow}
    end
  end
end
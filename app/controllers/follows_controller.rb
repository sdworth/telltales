class FollowsController < ApplicationController
  before_filter :require_authentication!

  def update
    @follow = Follow.new(
      user_id: @user.id,
      user_followed_id: params[:user_followed_id]
    )
    raise unless @follow.save

    respond_to do |format|
      format.json { render json: @follow}
    end
  end

  def destroy
    raise unless Follow.find(params[:id]).destroy

    respond_to do |format|
      format.json { render json: @follow}
    end
  end
end
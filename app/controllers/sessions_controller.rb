class SessionsController < ApplicationController
  def create
    @user = User.find_by(
      username: params[:user][:username]
    )

    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: 'You are now logged in.'
    else
      session[:user_id] = nil
      redirect_to root_path, alert: 'Could not find your account.'
    end
  end
end
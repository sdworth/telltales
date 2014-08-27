class SessionsController < ApplicationController
  def create
    @user = User.find_by(
      username: params[:user][:username]
    )

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: 'You are now logged in.'
    else
      session[:user_id] = nil
      redirect_to root_path, alert: 'Username or password is incorrect!'
    end
  end

  def show
    destroy
  end

  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to root_path
  end
end
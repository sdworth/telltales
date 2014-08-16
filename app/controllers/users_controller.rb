class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Your account has been successfully created.'
    else
      redirect_to root_path, alert: 'Sorry, your account could not be created.'
    end
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation, :username)
  end
end

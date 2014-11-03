class UsersController < ApplicationController
  before_filter :require_authentication!, except: [:create]

  def index
    @user = User.find(session[:user_id])

    render json: @user.id
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Your account has been successfully created.'
    else
      redirect_to root_path, alert: 'Sorry, your account could not be created.'
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_user_path, notice: 'Your profile has been updated!'
    else
      flash[:notice] = 'oopsie'
      render :edit
    end
  end

  def show
    @profile_user = User.find(params[:id])
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation, :username, :avatar)
  end
end

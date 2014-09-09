class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.json { render json: @user.id}
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Your account has been successfully created.'
    else
      redirect_to root_path, alert: 'Sorry, your account could not be created.'
    end
  end

  def show
    @user = User.find(session[:user_id])
    redirect_to '/' if @user == nil

    @addition = Addition.new


    @profile_user = User.find(params[:id])
    @follow = Follow.find_by("user_id = #{@user.id} AND user_followed_id = #{@profile_user.id}")

    @starts = Start.where(user_id: @profile_user.id).order(updated_at: :desc)
    @addition_starts = Addition.where(user_id: @profile_user.id).collect{|addition|
      addition.start unless addition.start.user_id == @profile_user.id
    }.compact.uniq.sort_by{|start| start.updated_at}.reverse
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation, :username)
  end
end

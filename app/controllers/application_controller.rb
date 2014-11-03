class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_authentication!

  helper_method :current_user, :logged_in?

  private

  def require_authentication!
    @user = User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: "You must be logged in to do that!"
  end

  def current_user
    @user ||= User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end
end

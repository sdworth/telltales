class RootController < ApplicationController
  layout 'login'
  skip_before_filter :require_authentication!

  def show
    redirect_to "/dashboard" if logged_in?

    @user = User.new
  end

  def new
    @register_check = User.all.collect {|user| user.username}

   render json: @register_check
  end
end
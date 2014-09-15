class RootController < ApplicationController
  layout 'login'

  def show
    redirect_to "/dashboard" if session[:user_id]

    @user = User.new

    # http://localhost:3000/username_availability.json?username=savannah
  end

  def new
    @register_check = User.all.collect {|user| user.username}

    respond_to do |format|
      format.json { render json: @register_check}
    end
  end
end
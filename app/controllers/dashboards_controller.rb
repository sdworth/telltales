class DashboardsController < ApplicationController

  def show
    redirect_to root_path if session[:user_id] == nil

    @user = User.find(session[:user_id])
    @starts = Start.where(user_id: @user.id)

    respond_to do |format|
      format.html
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

end
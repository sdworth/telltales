class DashboardsController < ApplicationController

  before_filter :require_authentication!

  def show
    @starts = Start.where(user_id: @user.id).order(created_at: :desc)
    @addition = Addition.new

    respond_to do |format|
      format.html
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

end
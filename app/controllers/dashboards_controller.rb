class DashboardsController < ApplicationController

  before_filter :require_authentication!

  def show
    @starts = Start.where(user_id: @user.id).order(created_at: :desc)

    @starts = (@starts + Addition.where(user_id: @user.id).collect{|addition| addition.start}
    ).sort_by{|start| start.updated_at}.reverse.uniq

    @addition = Addition.new

    respond_to do |format|
      format.html
      format.json { render json: @starts }
      format.xml { render xml: @starts }
    end
  end

end
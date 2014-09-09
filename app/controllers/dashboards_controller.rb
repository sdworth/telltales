class DashboardsController < ApplicationController

  before_filter :require_authentication!

  def show
    @starts = Start.where(user_id: @user.id)

    @starts = @starts + Addition.where(user_id: @user.id).collect{|addition| addition.start}

    Follow.where(user_id: @user.id).each {|follow|
      @starts = @starts + Start.where(user_id: follow.user_followed_id) + Addition.where(user_id: follow.user_followed_id).collect{|addition| addition.start}
    }

    @starts = @starts.sort_by{|start| start.updated_at}.reverse.uniq

    @addition = Addition.new

    respond_to do |format|
      format.html
      format.json { render json: @starts }
      format.xml { render xml: @starts }
    end
  end

end
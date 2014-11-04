class DashboardsController < ApplicationController
  def show
    @dashboard = Dashboard.new(current_user)

    respond_to do |format|
      format.html
      format.json { render json: @dashboard.get_starts}
    end
  end
end
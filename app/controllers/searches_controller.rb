class SearchesController < ApplicationController
  before_filter :require_authentication!

  def show
    #facade this
    @starts = (Start.where("title LIKE '%#{search_params[:search].downcase}%'") + Start.where("title LIKE '%#{search_params[:search].capitalize}%'") + Start.where("title LIKE '%#{search_params[:search]}%'")).uniq.sort_by{|start| start[:updated_at]}.reverse

    @users = (User.where("username LIKE '%#{search_params[:search].downcase}%'") + User.where("username LIKE '%#{search_params[:search].capitalize}%'") + User.where("username LIKE '%#{search_params[:search]}%'")).uniq

    @search_string = search_params[:search]

    @addition = Addition.new
  end

  private

  def search_params
    params.permit(:search)
  end
end

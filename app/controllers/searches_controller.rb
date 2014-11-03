class SearchesController < ApplicationController
  def show
    #facade this
    @starts = Start.where("title ILIKE '%#{search_params[:search]}%'").order('created_at DESC')

    @users = User.where("username ILIKE '%#{search_params[:search].downcase}%'").order('created_at DESC')

    @search_string = search_params[:search]
  end

  private

  def search_params
    params.permit(:search)
  end
end

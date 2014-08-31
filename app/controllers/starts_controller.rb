require 'bazaar'

class StartsController < ApplicationController
  before_filter :require_authentication!

  def new
    @start = Start.new

    respond_to do |format|
      format.html
      format.json { render json: [Bazaar.item, Bazaar.super_adj, Bazaar.super_item] }
    end
  end

  def create
    @start = @user.starts.build(start_params)

    if @start.save
      flash[:notice] = "Story '#{@start.title}' created!"
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  def show
    @start = Start.find(params[:id])
    @additions = @start.additions

      @additions.collect! { |addition|
        addition[username] = User.find(addition.user_id).username
      }

    respond_to do |format|
      format.json { render json: @additions}
    end
  end

  private

  def start_params
    params[:start].permit(:title, :story_text)
  end
end

# [{"id":1,"user_id":4,"title":"wams ","story_text":"i am a young one trapped in the thoughts of an old one's head. while the others are just blurring away i'm trying to trick myself...","additions":[],"completed":false,"created_at":"2014-08-26T19:29:11.346Z","updated_at":"2014-08-26T19:29:11.346Z"},[]]



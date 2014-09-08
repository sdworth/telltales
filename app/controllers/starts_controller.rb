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

      @usernames = @additions.collect {|addition|
        user = User.find(addition.user_id)

          [addition.id, user.id, user.username]
      }

    respond_to do |format|
      format.json { render json: [@additions, @usernames]}
    end
  end

  private

  def start_params
    params[:start].permit(:title, :story_text)
  end
end

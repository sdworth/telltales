class StartsController < ApplicationController
  before_filter :require_authentication!

  def new
    @start = Start.new
  end

  def create
    @start = Start.new(start_params.merge({user_id: current_user.id}))

    if @start.save
      redirect_to dashboard_path, notice: "Story '#{@start.title}' created!"
    else
      flash[:notice] = @start.errors.full_messages
      render :new
    end
  end

  def show
    @additions = Start.find(params[:id]).additions

    @usernames = @additions.collect {|addition|
      user = User.find(addition.user_id)

      [addition.id, user.id, user.username]
    }

    render json: [@additions, @usernames]
  end

  def prompt
    render json: Prompt.get_array
  end

  private

  def start_params
    params[:start].permit(:title, :story_text)
  end
end

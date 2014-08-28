require 'random_word_generator'

class StartsController < ApplicationController
  before_filter :require_authentication!

  def new
    @start = Start.new

    respond_to do |format|
      format.html
      format.json { render json: [RandomWordGenerator.word, RandomWordGenerator.word, RandomWordGenerator.word] }
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

  private

  def start_params
    params[:start].permit(:title, :story_text)
  end
end

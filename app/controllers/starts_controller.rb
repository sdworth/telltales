require 'random_word_generator'

class StartsController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @start = Start.new

    respond_to do |format|
      format.html
      format.json { render json: "#{RandomWordGenerator.word} #{RandomWordGenerator.word} #{RandomWordGenerator.word}" }
    end
  end

  def create
    @user = User.find(session[:user_id])
    @start = Start.new(
      story_text: params[:start]['story_text'],
      title: params[:start]['title'],
      user_id: @user.id
    )
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

class AdditionsController < ApplicationController
  def create
    @start = Start.find(params[:start_id])

    @addition = @user.additions.build(addition_params)

    @addition.start_id = @start.id

    @addition.addition_number = @start.additions.count + 1

    if @addition.save
      @addition.start.update(updated_at: Time.now)

      respond_to do |format|
        format.json { render json: [@addition, @addition.user.username, @addition.user.id] }
      end
    else
      raise
    end
  end

  def destroy
    @addition = Addition.find(params[:id])

    if @addition.start.user_id == @user.id
      @addition.destroy
    else
      raise 'not authorized to delete'
    end

    respond_to do |format|
      format.json { render json: @addition}
    end
  end

  private


  def addition_params
    params[:addition].permit(:addition_text)
  end

end

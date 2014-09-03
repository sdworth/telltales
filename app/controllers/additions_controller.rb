class AdditionsController < ApplicationController
  before_filter :require_authentication!

  def create
    @start = Start.find(params[:start_id])

    @addition = @user.additions.build(addition_params)

    @addition.start_id = @start.id

    @addition.addition_number = @start.additions.count + 1

    flash[:notice] = 'addition added!' if @addition.save

    redirect_to root_path

      # respond_to do |format|
      #   format.json { render json: @additions}
      # end

  end

  def addition_params
    params[:addition].permit(:addition_text)
  end

end

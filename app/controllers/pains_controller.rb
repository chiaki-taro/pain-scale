class PainsController < ApplicationController
  def index
    @pains = Pain.all.order(created_at: :desc)
  end

  def new
    @pain = Pain.new
  end

  def create
    @pain = Pain.new(pain_params)
    if @pain.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pain_params
    params.require(:pain).permit(:time, :pain_scale_id, :treatment, :evaluation, :memo).merge(user_id: current_user.id)
  end

end

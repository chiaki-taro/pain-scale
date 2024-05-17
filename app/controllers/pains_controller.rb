class PainsController < ApplicationController
  before_action :authenticate_user!

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

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def pain_params
    params.require(:pain).permit(:time, :pain_part, :pain_scale_id, :treatment, :evaluation, :memo).merge(patient_id: params[:patient_id])
  end

end

class PainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:index, :new, :create]

  def index
    @pains = @patient.pains.order(created_at: :desc)
  end

  def new
    @pain = Pain.new
  end

  def create
    @pain = Pain.new(pain_params)
    if @pain.save
      redirect_to patient_path(@patient)
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

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def pain_params
    params.require(:pain).permit(:time, :pain_part, :pain_scale_id, :treatment, :evaluation, :memo).merge(patient_id: params[:patient_id])
  end

end

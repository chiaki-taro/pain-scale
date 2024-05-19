class PainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_pain, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @pain.update(pain_params)
      redirect_to patient_path(@patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pain.destroy
    redirect_to patient_path(@patient)
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_pain
    @pain = @patient.pains.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: '権限がありません' unless @patient.user == current_user
  end

  def pain_params
    params.require(:pain).permit(:time, :pain_part, :pain_scale_id, :treatment, :evaluation, :memo).merge(patient_id: params[:patient_id])
  end

end

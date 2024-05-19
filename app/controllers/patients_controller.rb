class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_exist_patients, only: :index
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pains = @patient.pains.order(created_at: :desc)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def patient_params
    params.require(:patient).permit(:patient_name).merge(user_id: current_user.id)
  end

  def check_exist_patients
    @patients = current_user.patients.order(patient_name: :asc)
    redirect_to new_patient_path if @patients.empty?
  end

  def set_patient
    @patient = current_user.patients.find(params[:id])
  end

end

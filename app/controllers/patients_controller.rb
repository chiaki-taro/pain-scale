class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_exist_patients, only: :index
  before_action :set_patient, only: :show

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
    @patients = current_user.patients.order(created_at: :desc)
    redirect_to new_patient_path if @patients.empty?
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end

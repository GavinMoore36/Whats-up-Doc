class Api::V1::PatientsController < ApplicationController
  before_action :find_patient, only: [:update]
  def index
    @patients = Patient.all
    render json: @patients
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.save
      render json: @patient, status: :accepted
    else
      render json: { errors: @patient.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @patient.update(patient_params)
    if @patient.save
      render json: @patient, status: :accepted
    else
      render json: { errors: @patient.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :description, :image, :username, :password)
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end
end

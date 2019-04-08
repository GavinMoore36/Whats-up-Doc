class Api::V1::DoctorsController < ApplicationController
  before_action :find_doctor, only: [:update]
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def create
    @doctor = Doctor.create(doctor_params)
    if @doctor.save
      render json: @doctor, status: :accepted
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @doctor.update(doctor_params)
    if @doctor.save
      render json: @doctor, status: :accepted
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :description, :image, :hospital_id, :username, :password)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end
end

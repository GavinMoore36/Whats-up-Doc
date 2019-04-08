class Api::V1::LoginController < ApplicationController

  def patient_login
    @patients = Patient.all
    @patient = @patients.find_by(username: params[:username])
    if @patient.nil? #is the entered username in the db?
      render json: {error: "Username not found"}
    else
    render json: @patient, status: :ok
  end
  end

  def login
    @doctors = Doctor.all
    @doctor = @doctors.find_by(username: params[:username])
    if @doctor.nil? #is the entered username in the db?
      render json: {error: "Username not found"}
    else
    render json: @doctor, status: :ok
  end
  end


  private

  def patient_login_params
    params.require(:patient).permit(:username, :password)
  end

  def login_params
    params.require(:doctor).permit(:username, :password)
  end

end

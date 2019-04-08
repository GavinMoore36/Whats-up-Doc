class Api::V1::HospitalsController < ApplicationController
  
  def index
    @hospitals = Hospital.all
    render json: @hospitals
  end

end

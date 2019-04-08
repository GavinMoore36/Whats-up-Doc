class Api::V1::VisitsController < ApplicationController
  before_action :find_visit, only: [:update]
  def index
    @visits = Visit.all
    render json: @visits
  end

  def create
    @visit = Visit.create(visit_params)
    if @visit.save
      render json: @visit, status: :accepted
    else
      render json: { errors: @visit.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @visit.update(visit_params)
    if @visit.save
      render json: @visit, status: :accepted
    else
      render json: { errors: @visit.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def visit_params
    params.permit(:ailment, :description, :doctor_id, :patient_id)
  end

  def find_visit
    @visit = Visit.find(params[:id])
  end
end

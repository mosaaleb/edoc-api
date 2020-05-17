# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    render json: doctors, each_serializer: DoctorsSerializer
  end

  def show
    render json: doctor
  end

  private

  def query_params
    params.permit(:speciality, :name,
                  :fees_from, :fees_to,
                  :experience_from, :experience_to)
  end

  def doctor
    @doctor ||= Doctor.find(params[:id])
  end

  def doctors
    SearchDoctors.call(Doctor.all, query_params)
  end
end

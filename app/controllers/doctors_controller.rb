# frozen_string_literal: true

class DoctorsController < ApplicationController
  skip_before_action :authorize_request

  def index
    render json: doctors
  end

  private

  def query_params
    params.permit(:speciality, :name,
                  :fees_from, :fees_to,
                  :experience_from, :experience_to)
  end

  def doctors
    SearchDoctors.call(Doctor.all, query_params)
  end
end

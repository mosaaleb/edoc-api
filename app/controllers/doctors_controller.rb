# frozen_string_literal: true

class DoctorsController < ApplicationController
  skip_before_action :authorize_request

  def index
    render json: doctors
  end

  private

  def doctors
    Doctor.special_in(params[:speciality])
  end
end

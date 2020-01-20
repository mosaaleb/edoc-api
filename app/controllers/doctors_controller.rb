# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    render json: doctors
  end

  def show
    doctor = Account.find(params[id])
    render json: doctor
  end

  private

  def doctor_params
    params.require(:doctor).permit(:id, :speciality_id)
  end

  def doctors
    return Doctor.all unless params[:speciality_id]

    Doctor.find_by(speciality_id: params[:speciality_id])
  end
end

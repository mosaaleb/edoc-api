# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    render json: doctors.to_json(only: %i[id first_name last_name speciality])
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
    return Account.doctors unless params[:speciality_id]

    Account.doctors_special_in(params[:speciality_id])
  end
end

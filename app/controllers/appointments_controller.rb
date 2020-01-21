# frozen_string_literal: true

class AppointmentsController < ApplicationController
  skip_before_action :authorize_request

  def create
    Appointment.create!(appointment_params)

    res = {
      message: "Appointment with Doctor #{doctor_name}"
    }

    render json: res, status: :created
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :date)
  end

  def doctor_name
    Doctor.find(params[:appointment][:doctor_id]).account.full_name
  end
end

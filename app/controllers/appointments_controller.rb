# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def create
    current_user.appointments.create!(appointment_params)

    res = {
      message: "Appointment with Doctor #{doctor_name} is scheduled"
    }

    render json: res, status: :created
  end

  def index
    # TODO: change currentuser to currentuser
    current_user = Patient.first
    appointments = current_user.appointments

    render json: appointments, include: ['doctor.account', 'doctor.speciality']
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date)
  end

  def doctor_name
    Doctor.find(params[:appointment][:doctor_id]).full_name
  end
end

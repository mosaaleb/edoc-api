# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    appointments = current_user.appointments
    render json: appointments
  end

  def create
    current_user.appointments.create!(appointment_params)
    res = {
      message: "Appointment with Dr.#{doctor_name} is scheduled"
    }
    render json: res, status: :created
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    res = {
      message: "Appointment with Dr.#{appointment.doctor.full_name} is canceled"
    }
    render json: res, status: :ok
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date)
  end

  def appointment
    Appointment.find(params[:id])
  end

  def doctor_name
    Doctor.find(params[:appointment][:doctor_id]).full_name
  end
end

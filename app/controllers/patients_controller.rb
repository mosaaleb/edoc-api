# frozen_string_literal: true

class PatientsController < ApplicationController
  skip_before_action :authorize_request

  def create
    patient = Patient.create!(patient_params)
    auth_token = AuthenticateUser.call(patient.email, patient.password)

    res = {
      auth_token: auth_token,
      current_user: patient
          .as_json(only: [:id],
                   include: { account: { only: %i[first_name last_name] } }),
      message: 'Account Created Successfully'
    }

    render json: res, status: :created
  end

  private

  def patient_params
    params.require(:patient)
          .permit(account_attributes: %i[email
                                         password
                                         last_name
                                         first_name
                                         password_confirmation])
  end
end

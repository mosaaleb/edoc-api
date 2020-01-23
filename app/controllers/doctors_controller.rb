# frozen_string_literal: true

class DoctorsController < ApplicationController
  skip_before_action :authorize_request

  def index
    render json: doctors
      .to_json(only: %i[role_id first_name last_name speciality])
  end

  private

  def doctors
    Account.doctors_special_in(params[:speciality_id])
  end
end

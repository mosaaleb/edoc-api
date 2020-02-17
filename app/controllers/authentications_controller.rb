# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  skip_before_action :authorize_request

  def authenticate
    auth_token = AuthenticateUser
                 .call(auth_params[:email], auth_params[:password])

    res = {
      auth_token: auth_token,
      current_user: account_role
          .as_json(only: [:id],
                   include: { account: { only: %i[first_name last_name] } }),
      message: 'You have successfully signed in.'
    }
    render json: res
  end

  private

  def auth_params
    params.require(:authentication).permit(:email, :password)
  end

  def account
    Account.find_by(email: auth_params[:email])
  end

  def account_role
    Patient.find(account.role_id)
  end
end

# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  skip_before_action :authorize_request

  def authenticate
    auth_token = AuthenticateUser
                 .call(auth_params[:email], auth_params[:password])

    res = {
      auth_token: auth_token,
      current_user: account.name_and_id,
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
end

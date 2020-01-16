# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  def authenticate
    auth_token = AuthenticateUser
                 .call(auth_params[:email], auth_params[:password])
    render json: { auth_token: auth_token }
  rescue ExceptionHandler::AuthenticationError => e
    render json: { message: e }, status: :unauthorized
  end

  def auth_params
    params.permit(:email, :password)
  end
end

# frozen_string_literal: true

# TODO: FIXBUG OF rspec not rescuring errors and raising exceptions
# TODO: handle activerecord::recordinvalid here instead of accounts_con

module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end
  class AuthenticationError < StandardError; end

  included do
    # rescue_from ActiveRecord::RecordInvalid, with: :validation_failed
    rescue_from ExceptionHandler::MissingToken, with: :token_is_missing
    rescue_from ExceptionHandler::InvalidToken, with: :token_is_invalid
    # rescue_from ExceptionHandler::AuthenticationError, with: :
  end

  private

  # def validatation_failed(error)
  #   render json: { messege: error }, status: :bad_request
  # end

  def token_is_missing(error)
    render json: { message: error }, status: :unprocessable_entity
  end

  def token_is_invalid(error)
    render json: { message: error }, status: :unprocessable_entity
  end

  # def account_not_found(error)
  #   error
  #   # json_response({ message: error.message }, :unauthorized)
  #   # render json: { message: error }, status: :unauthorized
  # end
end

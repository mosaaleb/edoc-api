# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end
  class AuthenticationError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :validation_failed
    rescue_from ExceptionHandler::MissingToken, with: :token_is_missing
    rescue_from ExceptionHandler::InvalidToken, with: :token_is_invalid
    rescue_from ExceptionHandler::AuthenticationError, with: :account_not_found
  end

  private

  def validation_failed(error)
    render json: { message: error.record.errors.messages }, status: :bad_request
  end

  def token_is_missing(error)
    render json: { message: error }, status: :unprocessable_entity
  end

  def token_is_invalid(error)
    render json: { message: error }, status: :unprocessable_entity
  end

  def account_not_found(error)
    render json: { message: error }, status: :unauthorized
  end
end

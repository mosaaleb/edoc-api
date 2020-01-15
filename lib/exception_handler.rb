# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end
  class AuthenticationError < StandardError; end

  included do
    rescue_from ExceptionHandler::MissingToken, with: :token_is_missing
    rescue_from ExceptionHandler::InvalidToken, with: :token_is_invalid
    rescue_from ExceptionHandler::AuthenticationError, with: :user_not_found
  end

  private

  def token_is_missing(error)
    json_response({ message: error.messeage }, :unprocessable_entity)
  end

  def token_is_invalid(error)
    json_response({ message: error.message }, :unprocessable_entity)
  end

  def user_not_found(error)
    json_response({ message: error.message }, :unauthorized)
  end
end

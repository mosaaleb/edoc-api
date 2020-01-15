# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  class AuthenticationError < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :user_not_found
  end

  private

  def user_not_found(error)
    json_response({ message: error.message }, :unauthorized)
  end
end

# frozen_string_literal: true

class AuthorizeApiRequest
  attr_reader :headers

  def self.call(headers = {})
    new(headers).call
  end

  def initialize(headers = {})
    @headers = headers
  end

  def call
    account
  end

  private

  def account
    @account ||= Account.find(decoded_token[:account_id]) if decoded_token
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken,
      ("Invalid Token #{e.message}")
    )
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(token)
  end

  def token
    return headers['Authorization'].split.last if headers['Authorization']

    raise ExceptionHandler::MissingToken, 'Missing Token'
  end
end

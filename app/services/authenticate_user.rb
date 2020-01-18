# frozen_string_literal: true

class AuthenticateUser
  attr_reader :email, :password

  def self.call(email, password)
    new(email, password).call
  end

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(account_id: account.id) if account
  end

  private

  def account
    account = Account.find_by(email: email)
    return account if account&.authenticate(password)

    raise ExceptionHandler::AuthenticationError, 'Invalid Credentials'
  end
end

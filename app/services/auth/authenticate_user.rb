# frozen_string_literal: true

class AuthenticateUser
  attr_reader :email, :password

  def self.call(account)
    new(account).call
  end

  def initialize(account)
    @email = account.email
    @password = account.password
  end

  def call
    JsonWebToken.encode(account_id: account.id) if account
  end

  private

  def account
    account = Account.find_by(email: email)
    return account if account&.authenticate(password)

    raise ExceptionHandler::AuthenticationError, /Invalid Credentials/
  end
end

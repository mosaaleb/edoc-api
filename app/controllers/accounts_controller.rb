# frozen_string_literal: true

class AccountsController < ApplicationController
  def create
    account = Account.new(account_params)

    if account.save
      auth_token = AuthenticateUser.call(account.email, account.password)
      res = { message: 'Account Created Successfully', auth_token: auth_token }
      render json: res, status: :created
    else
      render json: { message: account.errors.full_messages },
             status: :bad_request
    end
  end

  def account_params
    params.permit(:email,
                  :first_name,
                  :last_name,
                  :password,
                  :passsword_confirmation)
  end
end

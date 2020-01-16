# frozen_string_literal: true

class AccountsController < ApplicationController
  def create
    account = Account.create!(account_params)

    auth_token = AuthenticateUser.call(account.email, account.password)
    res = { message: 'Account Created Successfully', auth_token: auth_token }
    render json: res, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { message: e },
           status: :bad_request
  end

  def account_params
    params.permit(:email,
                  :first_name,
                  :last_name,
                  :password,
                  :passsword_confirmation)
  end
end

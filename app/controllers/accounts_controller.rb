# frozen_string_literal: true

class AccountsController < ApplicationController
  skip_before_action :authorize_request

  def create
    account = Account.new(account_params)
    account.role = Patient.new
    account.save!

    auth_token = AuthenticateUser.call(account.email, account.password)
    res = {
      auth_token: auth_token,
      current_user: account.id_and_name_and_role,
      message: 'Account Created Successfully'
    }
    render json: res, status: :created
  end

  private

  def account_params
    params.require(:account).permit(:email,
                                    :first_name,
                                    :last_name,
                                    :password,
                                    :password_confirmation)
  end
end

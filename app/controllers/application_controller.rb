# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler
  attr_reader :current_user
  before_action :authorize_request
  serialization_scope :current_user

  private

  def authorize_request
    account = AuthorizeApiRequest.call(request.headers)
    @current_user = Patient.find(account.role_id)
  end
end

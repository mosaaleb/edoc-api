# frozen_string_literal: true

# TODO: specs

class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.call(request.headers)
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  describe 'GET /appointments' do
    it 'return all appointments for the current_user' do
      get '/appointments'
      expect(response).to have_http_status(:ok)
    end
  end
end

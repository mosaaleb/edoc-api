# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Doctors', type: :request do
  let(:patient) { create :patient }
  let(:doctor) { create_list(:doctor, 3) }

  let(:headers) do
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json',
      'Authorization' =>
        "Bearer #{JsonWebToken.encode(account_id: patient.account.id)}"
    }
  end

  describe 'GET /doctors' do
    before { get '/doctors', headers: headers }

    it { expect(response).to have_http_status(:ok) }
    it { expect(json).to match_array([]) }
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  let(:account) { create(:account, :for_patient) }
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end
  let(:valid_credentials) do
    {
      email: account.email,
      password: account.password
    }.to_json
  end

  let(:invalid_credentials) do
    {
      email: Faker::Internet.email,
      password: Faker::Internet.password
    }.to_json
  end

  describe 'POST /authenticate' do
    context 'with valid credentials' do
      before do
        post '/authenticate', params: valid_credentials, headers: headers
      end

      it { expect(response).to have_http_status(:ok) }

      it do
        expect(json.keys).to match_array(%w[auth_token current_user message])
      end
    end

    context 'with invalid credentials' do
      before do
        post '/authenticate', params: invalid_credentials, headers: headers
      end

      it { expect(response).to have_http_status(:unauthorized) }
      it { expect(json['message']).to match(/Invalid Credentials/) }
    end
  end
end

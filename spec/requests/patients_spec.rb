# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patients', type: :request do
  let(:headers) do
    { 'CONTENT-TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  let(:valid_attributes) do
    {
      patient: {
        account_attributes: {
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: '123456',
          password_confirmation: '123456'
        }
      }
    }.to_json
  end

  let(:invalid_params) do
    {
      patient: {
        account_attributes: {
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: '123456',
          password_confirmation: '12345666666'
        }
      }
    }.to_json
  end

  describe 'POST /patients' do
    context 'with valid account attributes' do
      before { post '/patients', params: valid_attributes, headers: headers }

      it 'have status created' do
        expect(response).to have_http_status(:created)
      end

      it 'respond with user information' do
        expect(json.keys).to match_array(%w[auth_token current_user message])
      end
    end

    context 'with invalid account attributes' do
      before { post '/patients', params: invalid_params, headers: headers }

      it 'have status bad request' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'respond with validation error messages' do
        expect(json['message']).to include(
          'account.password_confirmation' => ["doesn't match Password"]
        )
      end
    end
  end
end

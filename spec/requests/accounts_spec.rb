# frozen_string_literal: true

# TODO: refactor valid_attributes by building a user then use attributes_for

require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end
  let(:valid_attributes) do
    {
      account: {
        email: Faker::Internet.unique.email,
        first_name: Faker::Name.name,
        last_name: Faker::Name.name,
        password: '123456',
        password_confirmation: '123456'
      }
    }.to_json
  end
  let(:invalid_attributes) do
    {
      account: {
        email: Faker::Internet.unique.email,
        first_name: Faker::Name.name,
        last_name: Faker::Name.name,
        password: '',
        password_confirmation: '123456'
      }
    }.to_json
  end

  describe 'POST /accounts' do
    context 'with valid account attributes' do
      before { post '/accounts', params: valid_attributes, headers: headers }

      it { expect(response).to have_http_status(:created) }
      it { expect(json.keys).to match_array(%w[message auth_token]) }
    end

    context 'with invalid account attributes' do
      before { post '/accounts', params: invalid_attributes, headers: headers }

      it { expect(response).to have_http_status(:bad_request) }
      it { expect(json.keys).to match_array(%w[message]) }
    end
  end
end

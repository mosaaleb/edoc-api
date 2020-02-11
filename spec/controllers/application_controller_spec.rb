# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  subject(:app) { described_class.new }

  let(:account) { create(:account, :for_patient) }
  let(:headers) do
    {
      'Authorization' => "Bearer #{JsonWebToken.encode(account_id: account.id)}"
    }
  end
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe '#authorize_request' do
    context 'when auth token is present in headers' do
      before { allow(app.request).to receive(:headers).and_return(headers) }

      it 'sets the current user' do
        expect(app.send(:authorize_request))
          .to eq(Patient.find(account.role_id))
      end
    end

    context 'when auth token is not passed' do
      before do
        allow(app.request).to receive(:headers).and_return(invalid_headers)
      end

      it 'raises MissingToken error' do
        expect { app.send(:authorize_request) }
          .to raise_error(ExceptionHandler::MissingToken, /Missing Token/)
      end
    end
  end
end

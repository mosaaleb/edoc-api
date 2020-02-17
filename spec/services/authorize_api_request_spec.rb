# frozen_string_literal: true

require 'rails_helper'
require './app/services/authorize_api_request.rb'

RSpec.describe AuthorizeApiRequest do
  let(:account) { create(:account, :for_patient) }
  let(:headers) do
    {
      'Authorization' => "Bearer #{JsonWebToken.encode(account_id: account.id)}"
    }
  end
  let(:empty_headers) { {} }
  let(:fake_headers) do
    {
      'Authorization' => 'Bearer invalid_token'
    }
  end

  let(:invalid_headers) do
    {
      'Authorization' =>
      "Bearer #{JsonWebToken.encode(account_id: account.id + 1)}"
    }
  end

  let(:expired_headers) do
    {
      'Authorization' =>
      "Bearer #{JsonWebToken.encode({ account_id: account.id },
                                    Time.now.to_i - 20) }"
    }
  end

  describe '#call' do
    context 'when request has valid token' do
      it 'returns the user' do
        result = described_class.call(headers)
        expect(result).to eq(account)
      end
    end

    context 'when request has empty token' do
      it 'raises empty token error' do
        expect { described_class.call(empty_headers) }
          .to raise_error(
            ExceptionHandler::MissingToken,
            /Missing Token/
          )
      end
    end

    context 'when request has fake token' do
      it 'raises invalid token error' do
        expect { described_class.call(fake_headers) }
          .to raise_error(
            ExceptionHandler::InvalidToken,
            /Not enough or too many segments/
          )
      end
    end

    context 'when request has token with no registered user' do
      it 'raises invalid token error' do
        expect { described_class.call(invalid_headers) }
          .to raise_error(
            ExceptionHandler::InvalidToken,
            /Invalid Token Couldn't find Account with 'id'=#{account.id + 1}/
          )
      end
    end

    context 'when request has expired token' do
      it 'raises invalid token error' do
        expect { described_class.call(expired_headers) }
          .to raise_error(
            ExceptionHandler::InvalidToken,
            /Signature has expired/
          )
      end
    end
  end
end

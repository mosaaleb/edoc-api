# frozen_string_literal: true

require 'rails_helper'
require './app/services/auth/authenticate_user.rb'

RSpec.describe AuthenticateUser do
  let(:account) { create :account }
  let(:nonexistent_account) { build :account }

  describe '#call' do
    context 'when valid credentials' do
      it 'returns auth token' do
        token = described_class.call(account)
        expect(token).not_to be_nil
      end
    end

    context 'when invalid credentials' do
      it 'raises an error' do
        expect { described_class.call(nonexistent_account) }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Invalid Credentials/
          )
      end
    end
  end
end

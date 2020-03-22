# frozen_string_literal: true

require 'rails_helper'
require './app/services/authenticate_user.rb'

RSpec.describe AuthenticateUser do
  let(:account) { create(:account, :for_patient) }
  let(:no_account) { build(:account, :for_patient) }

  describe '::call' do
    context 'when valid credentials' do
      it 'returns auth token' do
        token = described_class.call(account.email, account.password)
        expect(token).not_to be_nil
      end
    end

    context 'when invalid credentials' do
      it 'raises an error' do
        expect { described_class.call(no_account.email, no_account.password) }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Invalid Credentials/
          )
      end
    end
  end
end

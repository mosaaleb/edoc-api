# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:doctors) { create_list(:account, 2, :for_doctor) }
  let(:patients) { create_list(:account, 2, :for_patient) }

  describe 'validations' do
    it { is_expected.to allow_value('email@address.foo').for(:email) }
    it { is_expected.not_to allow_value('foo').for(:email) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '::doctors' do
    it 'return all accounts with doctor role' do
      expect(described_class.doctors).to eq(doctors)
    end
  end

  describe '::patients' do
    it 'return all accounts with patient role' do
      patients
      expect(described_class.patients.size).to eq 2
    end
  end
end

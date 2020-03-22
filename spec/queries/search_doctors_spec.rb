# frozen_string_literal: true

require 'rails_helper'
require './app/queries/search_doctors.rb'

RSpec.describe SearchDoctors do
  let(:scoped_doctors) { class_double(Doctor) }
  let(:empty_search_params) { {} }
  let(:name_search_params) { { name: 'Arthur' } }
  let(:speciality_search_params) { { speciality: 'General Doctor' } }

  describe '::call' do
    context 'with no search params' do
      it 'return all doctors' do
        doctors = class_double(Doctor)
        expect(described_class.call(doctors, empty_search_params)).to eq doctors
      end
    end

    context 'with only name search params' do
      it 'call search_with_name method on scoped object' do
        doctors = class_double(Doctor, search_with_name: scoped_doctors)
        described_class.call(doctors, name_search_params)
        expect(doctors).to have_received(:search_with_name)
      end
    end

    context 'with only speciality search params' do
      it 'call special_in method on scoped object' do
        doctors = class_double(Doctor, special_in: scoped_doctors)
        described_class.call(doctors, speciality_search_params)
        expect(doctors).to have_received(:special_in)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DoctorReview, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:doctor) }
    it { is_expected.to belong_to(:patient) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:doctor_review) }

    it { is_expected.to validate_uniqueness_of(:doctor).scoped_to(:patient_id) }
  end
end

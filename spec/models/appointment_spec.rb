# frozen_string_literal: true

# require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:doctor) }
    it { is_expected.to belong_to(:patient) }
  end

  describe 'validations' do
    subject do
      FactoryBot.build(:appointment)
    end

    it { is_expected.to validate_presence_of(:date) }
    # it { is_expected.to validate_uniqueness_of(:doctor).scoped_to(:patient) }
  end
end

# TODO: validate uniqueness creates record which raise db exception

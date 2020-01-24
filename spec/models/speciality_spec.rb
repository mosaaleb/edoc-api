# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Speciality, type: :model do
  describe 'associations & validations' do
    it { is_expected.to have_many(:doctors) }
    it { is_expected.to validate_presence_of(:speciality) }
  end

  describe '::special_in' do
    let(:speciality) { create(:speciality) }

    it 'returns all specialities by their name' do
      spec = described_class.special_in(speciality.speciality)
      expect(spec.size).to eq 1
    end
  end
end

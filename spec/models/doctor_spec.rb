# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:years_of_experience) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:speciality) }
    it { is_expected.to have_one(:account) }
    it { is_expected.to have_many(:appointments) }
    it { is_expected.to have_many(:patients).through(:appointments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:liker_patients).through(:likes) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:reviewer_patients).through(:reviews) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:email).to(:account) }
    it { is_expected.to delegate_method(:first_name).to(:account) }
    it { is_expected.to delegate_method(:last_name).to(:account) }
    it { is_expected.to delegate_method(:full_name).to(:account) }
    it { is_expected.to delegate_method(:password).to(:account) }
  end

  describe '#liker_patients' do
    let(:doctor) { create(:doctor_with_likes, likes_count: 10) }

    it 'return all patients who liked a doctor' do
      expect(doctor.liker_patients.count).to eq(10)
    end

    it 'return number of likes that the doctor have' do
      expect(doctor.likes.count).to eq(10)
    end
  end

  describe '::special_in' do
    let(:doctors) { create_list(:doctor, 5) }
    let(:general_doctors) { create_list(:general_doctor, 5) }

    it 'returns all doctors if speciality is not defined' do
      expect(described_class.special_in).to eq(doctors)
    end

    it 'returns all doctors with specific speciality' do
      expect(described_class.special_in('General Doctor'))
        .to eq(general_doctors)
    end
  end
end

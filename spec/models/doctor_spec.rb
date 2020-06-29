# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/accountable_spec'

RSpec.describe Doctor, type: :model do
  it_behaves_like 'accountable'

  describe 'validations' do
    it { is_expected.to validate_presence_of(:fees) }
    it { is_expected.to validate_presence_of(:years_of_experience) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to belong_to(:speciality) }
    it { is_expected.to have_many(:appointments) }
    it { is_expected.to have_many(:liker_patients).through(:likes) }
    it { is_expected.to have_many(:patients).through(:appointments) }
    it { is_expected.to have_many(:reviewer_patients).through(:reviews) }
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
    let(:general_doctors) { create_list(:general_doctor, 5) }

    it 'returns all doctors with specific speciality' do
      expect(described_class.special_in('General Doctor'))
        .to eq(general_doctors)
    end
  end

  describe '::search_with_name' do
    let(:doctor) { create(:doctor_with_account) }

    it 'returns all doctors with their first or last name equal search param' do
      expect(described_class.search_with_name(doctor.first_name).count)
        .to eq 1
    end

    it 'case insensitive search' do
      expect(described_class.search_with_name('Courtney').to_sql)
        .to include('lower')
    end
  end
end

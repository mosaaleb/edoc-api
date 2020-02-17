# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:account) }
    it { is_expected.to have_many(:appointments) }
    it { is_expected.to have_many(:appointed_doctors).through(:appointments) }
    it { is_expected.to have_many(:doctor_likes) }
    it { is_expected.to have_many(:liked_doctors).through(:doctor_likes) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:email).to(:account) }
    it { is_expected.to delegate_method(:first_name).to(:account) }
    it { is_expected.to delegate_method(:last_name).to(:account) }
    it { is_expected.to delegate_method(:full_name).to(:account) }
    it { is_expected.to delegate_method(:password).to(:account) }
  end
end

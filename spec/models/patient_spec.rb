# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/accountable_spec'

RSpec.describe Patient, type: :model do
  it_behaves_like 'accountable'

  describe 'associations' do
    it { is_expected.to have_many(:appointments) }
    it { is_expected.to have_many(:appointed_doctors).through(:appointments) }
    it { is_expected.to have_many(:doctor_likes) }
    it { is_expected.to have_many(:liked_doctors).through(:doctor_likes) }
  end
end

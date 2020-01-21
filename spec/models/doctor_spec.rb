# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to belong_to(:speciality) }
  it { is_expected.to have_one(:account) }
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('email@address.foo').for(:email) }
  it { is_expected.not_to allow_value('foo').for(:email) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:password) }
end

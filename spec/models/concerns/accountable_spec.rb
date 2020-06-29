# frozen_string_literal: true

shared_examples 'accountable' do
  describe 'associations' do
    it { is_expected.to have_one(:account) }
    it { is_expected.to accept_nested_attributes_for(:account) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:email).to(:account) }
    it { is_expected.to delegate_method(:password).to(:account) }
    it { is_expected.to delegate_method(:full_name).to(:account) }
    it { is_expected.to delegate_method(:last_name).to(:account) }
    it { is_expected.to delegate_method(:first_name).to(:account) }
  end
end

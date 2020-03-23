# frozen_string_literal: true

module Accountable
  extend ActiveSupport::Concern

  included do
    has_one :account, as: :role, dependent: :destroy
    accepts_nested_attributes_for :account
  end

  delegate :email,
           :avatar,
           :password,
           :last_name,
           :full_name,
           :first_name, to: :account
end

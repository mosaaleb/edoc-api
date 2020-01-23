# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :account, as: :role, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  accepts_nested_attributes_for :account

  delegate :email,
           :first_name,
           :last_name,
           :full_name,
           :password, to: :account
end

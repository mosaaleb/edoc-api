# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :account, as: :role, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end

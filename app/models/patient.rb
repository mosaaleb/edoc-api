# frozen_string_literal: true

class Patient < ApplicationRecord
  include Accountable

  has_many :appointments, dependent: :destroy
  has_many :appointed_doctors, through: :appointments, source: :doctor
  has_many :doctor_likes, dependent: :destroy
  has_many :liked_doctors, through: :doctor_likes, source: :doctor
end

# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :account, as: :role, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :appointed_doctors, through: :appointments, source: :doctor
  has_many :doctor_likes, dependent: :destroy
  has_many :liked_doctors, through: :doctor_likes, source: :doctor

  accepts_nested_attributes_for :account

  delegate :email,
           :first_name,
           :last_name,
           :full_name,
           :password, to: :account
end

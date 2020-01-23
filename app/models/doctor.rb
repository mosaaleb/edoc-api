# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :speciality
  has_one :account, as: :role, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def self.special_in(speciality)
    joins(:speciality).where(specialities: { name: speciality })
  end

  delegate :email,
           :first_name,
           :last_name,
           :full_name,
           :password, to: :account
end

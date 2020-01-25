# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :speciality
  has_one :account, as: :role, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  delegate :email,
           :first_name,
           :last_name,
           :full_name,
           :password, to: :account

  # class methods
  def self.special_in(speciality = nil)
    return all unless speciality

    joins(:speciality).merge(Speciality.special_in(speciality))
  end
end

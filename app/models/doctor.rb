# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :speciality
  has_one :account, as: :role, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :likes, class_name: :DoctorLike, dependent: :destroy
  has_many :liker_patients, through: :likes, source: :patient

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

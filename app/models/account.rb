# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }

  validates :password, length: { minimum: 6, maximum: 30 }
  validates :first_name, :last_name, length: { minimum: 2, maximum: 20 }

  # associations
  belongs_to :role, polymorphic: true

  # class methods
  def self.doctors
    where(role_type: 'Doctor')
  end

  def self.patients
    where(role_type: 'Patient')
  end

  # TODO: user search by speciality name instead of id

  def self.doctors_special_in(speciality_id = nil)
    doctors = Account.joins_on_doctors

    unless speciality_id
      return doctors.select('accounts.*, specialities.speciality')
    end

    doctors
      .merge(Speciality.special_in_id(speciality_id))
      .select('accounts.*, specialities.speciality')
  end

  def self.joins_on_doctors
    sql =
      'INNER JOIN doctors ON doctors.id = accounts.role_id
       INNER JOIN specialities ON specialities.id = doctors.speciality_id'

    Account.doctors.joins(sql)
  end

  # instance methods
  def id_and_name
    as_json(only: %i[role_id first_name last_name])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

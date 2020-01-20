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

  def self.doctors_special_in(speciality_id)
    custom_join =
      'INNER JOIN doctors ON doctors.id = accounts.role_id
       INNER JOIN specialities ON specialities.id = doctors.speciality_id'

    Account.doctors
           .joins(custom_join)
           .merge(Speciality.special_in_id(speciality_id))
           .select('accounts.*, specialities.speciality')
  end

  # instance methods
  def id_and_name_and_role
    as_json(only: %i[id first_name last_name])
  end
end

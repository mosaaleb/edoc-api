# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password

  has_one_attached :avatar
  belongs_to :role, polymorphic: true

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }

  validates :password, length: { minimum: 6, maximum: 30 }
  validates :first_name, :last_name, length: { minimum: 2, maximum: 20 }

  def self.doctors
    where(role_type: 'Doctor')
  end

  def self.patients
    where(role_type: 'Patient')
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

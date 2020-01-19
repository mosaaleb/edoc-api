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

  # instance methods
  def id_and_name_and_role
    as_json(only: %i[id first_name last_name])
  end
end

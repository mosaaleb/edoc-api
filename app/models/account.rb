# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }

  validates :password, length: { minimum: 6, maximum: 30 }
  validates :first_name, :last_name, length: { minimum: 2, maximum: 20 }

  # instance methods
  def name_and_id
    as_json(only: %i[id first_name last_name])
  end
end

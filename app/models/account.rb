# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
end

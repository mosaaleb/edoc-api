# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password

  validates :email,
            :first_name,
            :last_name,
            :password_digest, presence: true
end

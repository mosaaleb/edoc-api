# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :account, as: :role, dependent: :destroy
end
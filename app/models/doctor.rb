# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_one :account, as: :role, dependent: :destroy
end

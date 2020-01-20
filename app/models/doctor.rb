# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :speciality
  has_one :account, as: :role, dependent: :destroy

  def self.special_in(speciality)
    joins(:speciality).where(specialities: { name: speciality })
  end
end

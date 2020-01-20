# frozen_string_literal: true

class Speciality < ApplicationRecord
  has_many :doctors, dependent: :destroy

  validates :name, presence: true

  def self.special_in(speciality)
    where(name: speciality)
  end

  def self.special_in_id(speciality_id)
    where(id: speciality_id)
  end
end

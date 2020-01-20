# frozen_string_literal: true

class Speciality < ApplicationRecord
  has_many :doctors, dependent: :destroy

  validates :name, presence: true
end

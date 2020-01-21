# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :doctor, uniqueness: { scope: :patient }
  validates :date, presence: true
end

# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :date, presence: true
  validates :doctor, uniqueness: { scope: :patient_id }
end

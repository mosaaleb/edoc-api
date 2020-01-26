# frozen_string_literal: true

class DoctorReview < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :doctor, uniqueness: { scope: :patient_id }
end

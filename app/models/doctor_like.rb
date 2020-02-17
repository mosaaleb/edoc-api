# frozen_string_literal: true

class DoctorLike < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :doctor, uniqueness: { scope: :patient_id }
end

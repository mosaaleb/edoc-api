# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :date, presence: true
  validates :doctor,
            uniqueness: {
              scope: :patient_id,
              message: lambda do |object, _|
                "Can't have another appointment with Dr.#{object
                .doctor.full_name}"
              end
            }
end

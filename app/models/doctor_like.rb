# frozen_string_literal: true

class DoctorLike < ApplicationRecord
  belongs_to :doctor, counter_cache: :likes_count
  belongs_to :patient

  validates :doctor, uniqueness: { scope: :patient_id }
end

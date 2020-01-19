# frozen_string_literal: true

class Doctor < ApplicationRecord
  enum speciality: { 'General Doctor' => 0,
                     'Skin & Hair' => 1,
                     'Child Care' => 2,
                     'Women\'s Health' => 3,
                     'Dentist' => 4,
                     'ENT' => 5, '
                      Homeopathy' => 6,
                     'Ayurveda' => 7 }

  has_one :account, as: :role, dependent: :destroy

  validates :speciality, presence: true
end

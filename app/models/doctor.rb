# frozen_string_literal: true

class Doctor < ApplicationRecord
  include Accountable

  validates :fees,
            :years_of_experience, presence: true

  belongs_to :speciality
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :likes, class_name: :DoctorLike, dependent: :destroy
  has_many :liker_patients, through: :likes, source: :patient
  has_many :reviews, class_name: :DoctorReview, dependent: :destroy
  has_many :reviewer_patients, through: :reviews, source: :patient

  def self.special_in(speciality)
    joins(:speciality).merge(Speciality.special_in(speciality))
  end

  def self.search_with_name(name)
    joins(:account)
      .where('lower(accounts.first_name) = ? OR lower(accounts.last_name) = ?',
             name.downcase, name.downcase)
  end
end

# frozen_string_literal: true

class DoctorReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :review,
             :created_at,
             :reviewer_name,
             :reviewer_avatar_url

  def reviewer_name
    reviewer.full_name
  end

  def reviewer_avatar_url
    polymorphic_url(reviewer.avatar)
  end

  private

  def reviewer
    @reviewer ||= Patient.find_by(id: object.patient_id)
  end
end

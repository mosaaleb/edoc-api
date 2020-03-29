# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :fees, :liked,
             :avatar_url, :speciality,
             :likes_count, :years_of_experience,
             :reviews, :full_name

  has_many :reviews, class_name: 'DoctorReview'

  def speciality
    object.speciality.speciality
  end

  def avatar_url
    polymorphic_url(object.avatar)
  end

  def liked
    current_user.liked?(object)
  end
end

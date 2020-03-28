# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :fees, :liked,
             :last_name, :first_name,
             :avatar_url, :speciality,
             :likes_count, :years_of_experience,
             :reviews

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

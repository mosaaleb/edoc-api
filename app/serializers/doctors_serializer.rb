# frozen_string_literal: true

class DoctorsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :fees, :liked,
             :last_name, :first_name,
             :avatar_url, :speciality,
             :likes_count, :years_of_experience

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

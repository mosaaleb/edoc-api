# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :fees,
             :last_name,
             :first_name,
             :avatar_url,
             :speciality,
             :years_of_experience

  def speciality
    object.speciality.speciality
  end

  def avatar_url
    polymorphic_url(object.avatar, host: 'localhost:3000')
  end
end

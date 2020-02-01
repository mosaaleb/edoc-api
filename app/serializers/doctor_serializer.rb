# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :years_of_experience,
             :speciality

  def speciality
    object.speciality.speciality
  end
end

# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :speciality

  def speciality
    object.speciality.speciality
  end
end

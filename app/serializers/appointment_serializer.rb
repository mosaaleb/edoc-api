# frozen_string_literal: true

class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date

  belongs_to :doctor
end

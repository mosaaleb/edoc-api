# frozen_string_literal: true

FactoryBot.define do
  factory :speciality do
    speciality { Faker::Speciality.name }
  end
end

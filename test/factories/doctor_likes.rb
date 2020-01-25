# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_like do
    association :doctor, strategy: :build
    association :patient, strategy: :build
  end
end

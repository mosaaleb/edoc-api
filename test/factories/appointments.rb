# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    date { Time.zone.now }
    association :doctor, factory: :doctor_with_account, strategy: :build
    association :patient, factory: :patient_with_account, strategy: :build
  end
end

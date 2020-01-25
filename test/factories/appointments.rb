# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    date { Time.zone.now }
    association :doctor, strategy: :build
    association :patient, strategy: :build
  end
end

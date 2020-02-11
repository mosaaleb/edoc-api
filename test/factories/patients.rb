# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    factory :patient_with_account do
      association :account, :for_patient, strategy: :build
    end
  end
end

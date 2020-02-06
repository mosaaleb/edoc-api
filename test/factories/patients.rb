# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
  end
  factory :patient_with_account, class: :Patient do
    association :account, strategy: :build
  end
end

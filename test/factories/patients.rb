# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    association :account, strategy: :build
  end
end

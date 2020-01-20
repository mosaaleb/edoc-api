# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    association :account, strategy: :create
  end
end

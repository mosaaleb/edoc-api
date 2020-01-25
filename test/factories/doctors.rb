# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    association :speciality, strategy: :build

    factory :general_doctor do
      association :speciality, speciality: 'General Doctor', strategy: :build

      after :create do |doctor|
        create :account, role: doctor
      end
    end
  end
end

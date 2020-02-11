# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    association :speciality, strategy: :build

    factory :doctor_with_likes do
      transient do
        likes_count { 5 }
      end

      after :create do |doctor, evaluator|
        create_list(:doctor_like, evaluator.likes_count, doctor: doctor)
      end
    end

    factory :doctor_with_account do
      association :account, strategy: :build
    end
  end

  factory :general_doctor, class: :Doctor do
    association :speciality, speciality: 'General Doctor', strategy: :build
  end
end

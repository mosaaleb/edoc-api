# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.name[2..20] }
    last_name { Faker::Name.name[2..20] }
    password { Faker::Internet.password }

    trait :for_doctor do
      association :role, factory: :doctor
    end

    trait :for_patient do
      association :role, factory: :patient
    end
  end
end

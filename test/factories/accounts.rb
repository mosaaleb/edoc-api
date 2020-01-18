# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.name[2..20] }
    last_name { Faker::Name.name[2..20] }
    password { Faker::Internet.password }
  end
end

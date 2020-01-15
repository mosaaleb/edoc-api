# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password { '123456' }
  end
end

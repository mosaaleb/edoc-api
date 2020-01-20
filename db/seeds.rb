# frozen_string_literal: true
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.connection.reset_pk_sequence!('specialities')
specialities = Speciality.create([{ name: 'General Doctor' },
                                  { name: 'Skin & Hair' },
                                  { name: 'Child Care' },
                                  { name: 'Women\'s Health' },
                                  { name: 'Dentist' },
                                  { name: 'ENT' },
                                  { name: 'Homeopathy' },
                                  { name: 'Ayurveda' },
                                  { name: 'Cardiac' },
                                  { name: 'Psychiatry' }])

ActiveRecord::Base.connection.reset_pk_sequence!('doctors')
doctors = Doctor.create([{ speciality_id: Speciality.find(1).id },
                         { speciality_id: Speciality.find(2).id },
                         { speciality_id: Speciality.find(3).id },
                         { speciality_id: Speciality.find(4).id },
                         { speciality_id: Speciality.find(5).id },
                         { speciality_id: Speciality.find(6).id },
                         { speciality_id: Speciality.find(7).id },
                         { speciality_id: Speciality.find(8).id },
                         { speciality_id: Speciality.find(9).id },
                         { speciality_id: Speciality.find(10).id }])


# doctors Accounts
ActiveRecord::Base.connection.reset_pk_sequence!('accounts')
accounts = Account.create(
  [
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(1) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(2) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(3) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(4) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(5) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(6) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(7) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(8) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(9) },
    { first_name: Faker::Name.name.split.last, last_name: Faker::Name.name.split.last, email: Faker::Internet.unique.email, password: Faker::Internet.password, role: Doctor.find(10) }
  ])
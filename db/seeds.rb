# frozen_string_literal: true
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.connection.reset_pk_sequence!('specialities')
specialities = Speciality.create!([
                                  { speciality: 'General Doctor' },
                                  { speciality: 'Skin & Hair' },
                                  { speciality: 'Child Care' },
                                  { speciality: 'Women\'s Health' },
                                  { speciality: 'Dentist' },
                                  { speciality: 'ENT' },
                                  { speciality: 'Homeopathy' },
                                  { speciality: 'Ayurveda' },
                                  { speciality: 'Cardiac' },
                                  { speciality: 'Psychiatry' }]
                                )
p "\n Specialities created \n"

ActiveRecord::Base.connection.reset_pk_sequence!('doctors')
(1..80).each do |i|
  id = (i % 10) == 0 ? 10 : (i % 10)
  Doctor.create!(speciality_id: id, 
                 fees: Faker::Number.within(range: 100..300),
                 years_of_experience: Faker::Number.within(range: 1..20))
end
p "\n Doctors created \n"


ActiveRecord::Base.connection.reset_pk_sequence!('accounts')
(1..80).each do |i|
  Account.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.unique.email,
                  password: Faker::Internet.password,
                  role: Doctor.find(i))
end
p "\n Doctor Accounts created \n"

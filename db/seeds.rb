# frozen_string_literal: true

require 'faker'

ActiveRecord::Base.connection.reset_pk_sequence!('specialities')
specialities = Speciality.create!([
  { speciality: 'ENT' },
  { speciality: 'Cardiac' },
  { speciality: 'Dentist' },
  { speciality: 'Ayurveda' },
  { speciality: 'Psychiatry' },
  { speciality: 'Child Care' },
  { speciality: 'Homeopathy' },
  { speciality: 'Skin & Hair' },
  { speciality: 'General Doctor' },
  { speciality: 'Women\'s Health' }]
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

ActiveRecord::Base.connection.reset_pk_sequence!('patients')
(1..800).each do |i|
  Account.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password,
    role: Patient.create
  )
end
p "\n Patients with accounts created \n"


ActiveRecord::Base.connection.reset_pk_sequence!('doctor_likes')
index = 1
Doctor.find_each do |doctor|
  number_of_likes = rand(1..10)

  number_of_likes.times do
    doctor.liker_patients << Patient.find(index)
    index += 1
  end
end
p "\n Doctor likes created \n"

ActiveRecord::Base.connection.reset_pk_sequence!('doctor_reviews')
index = 1
Doctor.find_each do |doctor|
  number_of_reviews = rand(1..7)

  number_of_reviews.times do
    doctor.reviews.create(
      patient_id: index,
      review: Faker::Lorem.sentence(word_count: 12, supplemental: true, random_words_to_add: 4)
    )
    print '.'
    index += 1
  end
  p "\n"
end
p "\n Doctor reviews created \n"

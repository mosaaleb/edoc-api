# frozen_string_literal: true

class AddUniqueIndexForDoctorPatientToDoctorLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :doctor_likes, %i[doctor_id patient_id], unique: true
  end
end

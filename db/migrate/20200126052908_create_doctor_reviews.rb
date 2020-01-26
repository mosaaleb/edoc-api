# frozen_string_literal: true

class CreateDoctorReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_reviews do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.text :review

      t.timestamps
    end

    add_index :doctor_reviews, %i[doctor_id patient_id], unique: true
  end
end

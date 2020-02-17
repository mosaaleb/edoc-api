# frozen_string_literal: true

class CreateDoctorLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_likes do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end

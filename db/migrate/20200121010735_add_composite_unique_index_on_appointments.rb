# frozen_string_literal: true

class AddCompositeUniqueIndexOnAppointments < ActiveRecord::Migration[6.0]
  def change
    add_index :appointments, %i[doctor_id patient_id], unique: true
  end
end

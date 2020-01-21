# frozen_string_literal: true

class AddSpecialityRefToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_reference :doctors, :speciality,
                  null: false, foreign_key: true,
                  index: true
  end
end

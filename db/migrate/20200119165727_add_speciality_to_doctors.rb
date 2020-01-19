# frozen_string_literal: true

class AddSpecialityToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :speciality, :integer, default: 0, null: false
  end
end

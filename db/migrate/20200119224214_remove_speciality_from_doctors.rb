# frozen_string_literal: true

class RemoveSpecialityFromDoctors < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :speciality, :integer
  end
end

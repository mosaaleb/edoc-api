# frozen_string_literal: true

class RenameNameToSpecialityInSpecialities < ActiveRecord::Migration[6.0]
  def change
    rename_column :specialities, :name, :speciality
  end
end

# frozen_string_literal: true

class AddYearsOfExperienceToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors,
               :years_of_experience,
               :integer,
               default: 1,
               null: false
  end
end

# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors, &:timestamps
  end
end

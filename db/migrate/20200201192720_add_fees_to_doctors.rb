# frozen_string_literal: true

class AddFeesToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :fees, :integer, default: 100, null: false
  end
end

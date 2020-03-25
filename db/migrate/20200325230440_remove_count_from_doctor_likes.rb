# frozen_string_literal: true

class RemoveCountFromDoctorLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctor_likes, :count, :integer
  end
end

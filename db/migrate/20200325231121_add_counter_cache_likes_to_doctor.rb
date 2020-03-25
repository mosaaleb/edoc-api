# frozen_string_literal: true

class AddCounterCacheLikesToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :likes_count, :integer, default: 0, null: false
  end
end

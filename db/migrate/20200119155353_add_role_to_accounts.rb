# frozen_string_literal: true

class AddRoleToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :accounts, :role, polymorphic: true, default: '', null: false
  end
end

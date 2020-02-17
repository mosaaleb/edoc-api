# frozen_string_literal: true

class AccountSerializer < ActiveModel::Serializer
  attributes :first_name,
             :last_name
end

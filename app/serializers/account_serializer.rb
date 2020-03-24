# frozen_string_literal: true

class AccountSerializer < ActiveModel::Serializer
  attributes :avatar,
             :last_name,
             :first_name
end

# frozen_string_literal: true

module Faker
  class Speciality < Base
    class << self
      def name
        fetch('speciality.name')
      end
    end
  end
end

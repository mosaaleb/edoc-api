# frozen_string_literal: true

module RequestHelper
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end
end

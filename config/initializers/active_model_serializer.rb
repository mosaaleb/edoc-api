# frozen_string_literal: true

ActiveModel::Serializer.config.adapter = :attributes
ActiveModel::Serializer.config.key_transform = :camel_lower

Rails.application.routes.default_url_options = {
  host: 'https://tranquil-river-82740.herokuapp.com/'
}

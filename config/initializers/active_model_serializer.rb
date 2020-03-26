ActiveModel::Serializer.config.adapter = :attributes
ActiveModel::Serializer.config.key_transform = :camel_lower

Rails.application.routes.default_url_options = {
  host: 'localhost:3000'
}

# frozen_string_literal: true

require 'image_processing/mini_magick'

class AvatarGenerator
  attr_reader :account

  AVATAR_COLORS = { '#561B8D' => '#C8F7C5',
                    '#DFF0D8' => '#468847',
                    '#F0E68C' => '#550055',
                    '#C8C8C8' => '#551700',
                    '#CD594A' => '#FFFFFF' }.freeze

  def self.call(account)
    new(account).call
  end

  def initialize(account)
    @account = account
  end

  def call
    generate_image
    # account.avatar.attach(io: File.open('default.jpeg'),
    #   filename: "#{account.first_name}-default.jpeg"
    # )

    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open('default.jpeg'),
      filename: "#{account.first_name}-default.jpeg",
      content_type: 'image/jpeg'
    )

    ActiveStorage::Attachment.create(name: 'avatar',
                                     record: account,
                                     blob_id: blob.id)

    clean
  end

  private

  def generate_image
    rand = rand 0..4
    MiniMagick::Tool::Convert.new do |image|
      image.size '200x200'
      image.gravity 'center'
      image.xc AVATAR_COLORS.keys[rand]
      image.pointsize 100
      image.fill AVATAR_COLORS.values[rand]
      image.draw "text 0,0 #{initial_letters}"
      image << 'default.jpeg'
    end
  end

  def initial_letters
    account.first_name.chr.capitalize + account.last_name.chr.capitalize
  end

  def clean
    File.delete('default.jpeg')
  end
end

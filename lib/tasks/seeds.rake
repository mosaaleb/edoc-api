# frozen_string_literal: true

namespace :seeds do
  desc 'generate initial avatars for seeded data'
  task generate_initial_avatars: :environment do
    Account.all.each do |account|
      AvatarGenerator.call(account)
      print '.'
    end

    puts "\nAdd done!"
  end
end

# frozen_string_literal: true

namespace :doctor_likes do
  desc 'update likes_count counter cache column'
  task update_likes_counter_cached_column: :environment do
    Doctor.find_each do |doctor|
      doctor.update_attribute(:likes_count, doctor.likes.count)

      print '.'
    end
    puts "\n counter cache updated"
  end
end

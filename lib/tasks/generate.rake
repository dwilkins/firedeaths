require 'active_record'
require 'active_support/all'

namespace :generate do
  desc 'Generate death information'
  task :deaths => :environment do
    COMMIT_SIZE = 1000
    TOTAL_INSERTS = 10000
    MAX_GAME_LAT = 4096
    MAX_GAME_LON = 2560
    MAX_DEAD_USER_ID = 1000
    MAX_WEAPON_ID = Weapon.all.count
    MAX_REASON_ID = DeathReason.all.count
    death_time_base = Random.rand(3).days.ago
    (TOTAL_INSERTS / COMMIT_SIZE).to_i.times do
      deaths = []
      RANDOM_GENERATOR = Random.new
      COMMIT_SIZE.to_i.times do
        deaths << {
          user_id: RANDOM_GENERATOR.rand(MAX_DEAD_USER_ID),
          death_game_lat: RANDOM_GENERATOR.rand(MAX_GAME_LAT),
          death_game_lon: RANDOM_GENERATOR.rand(MAX_GAME_LON),
          death_day: death_time_base.to_date,
          death_time: death_time_base.to_time + RANDOM_GENERATOR.rand(MAX_GAME_LON),
          weapon_id: RANDOM_GENERATOR.rand(MAX_WEAPON_ID+1),
          death_reason_id: RANDOM_GENERATOR.rand(MAX_REASON_ID)+1,
        }
      end
      ActiveRecord::Base.transaction do
        Death.create(deaths)
      end
      puts "Created #{COMMIT_SIZE} death rows"
    end
  end
end

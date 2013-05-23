require 'active_record'
require 'active_support/all'

namespace :generate do
  desc 'Generate death information'
  task :deaths => :environment do
    MAX_GAME_LAT = 4096
    MAX_GAME_LON = 2560
    MAX_DEAD_USER_ID = 1000
    MAX_WEAPON_ID = Weapon.all.count
    MAX_REASON_ID = DeathReason.all.count
    death_time_base = Random.rand(3).days.ago
    10000.times  do
      Death.create(user_id: Random.rand(MAX_DEAD_USER_ID),
                death_game_lat: Random.rand(MAX_GAME_LAT),
                death_game_lon: Random.rand(MAX_GAME_LON),
                death_day: death_time_base.to_date,
                death_time: death_time_base.to_time + Random.rand(MAX_GAME_LON),
                weapon_id: Random.rand(MAX_WEAPON_ID)+1,
                death_reason_id: Random.rand(MAX_REASON_ID)+1,
                )
    end
  end
end

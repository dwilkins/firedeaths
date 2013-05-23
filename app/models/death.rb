class Death < ActiveRecord::Base
  attr_accessible :death_day, :death_game_lat, :death_game_lon, :death_reason_id, :death_time, :user_id, :weapon_id
  belongs_to :base
  belongs_to :death_reason
  belongs_to :weapon

end

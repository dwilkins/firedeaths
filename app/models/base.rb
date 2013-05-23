class Base < ActiveRecord::Base
  attr_accessible :game_lat, :game_lon, :name
  has_many :deaths
end

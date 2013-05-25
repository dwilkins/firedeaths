class Base < ActiveRecord::Base
  attr_accessible :game_lat, :game_lon, :name
  has_many :deaths

  scope :base_deaths, joins(:deaths).group(:base_id)
  scope :weapons_deaths, joins(:deaths => [:base]).group(:base_id).group(:weapon_id)
  scope :death_reasons, joins(:deaths => [:base]).group(:base_id).group(:death_reason_id)
end

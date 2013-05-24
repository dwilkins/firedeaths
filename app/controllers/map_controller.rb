class MapController < ApplicationController
  respond_to :html
  def index
    @static_data = {reasons: DeathReason.all, weapons: Weapon.all}
    respond_with(@static_data)
  end
end

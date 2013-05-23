class DemiseController < ApplicationController
  respond_to :html, :json
  def index
    bases = Base.all
    weapons = Weapon.all
    reasons = DeathReason.all
    @base_data = {}
    @base_data['base_detail'] = []
    @base_data['weapons'] = weapons
    @base_data['reasons'] = reasons
    bases.each do |b|
      @base_data['base_detail'][b.id] = { base: b,
        death_toll:  Death.where(base_id: b.id).group(:weapon_id).group(:death_reason_id).count.collect {|a| {w: a[0][0], r: a[0][1], v: a[1]}}
      }
    end
    respond_with(@base_data)
  end
end

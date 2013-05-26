class AddIndexOnBaseWeaponAndDeathReasonToDeath < ActiveRecord::Migration
  def change
    add_index :deaths, [:base_id, :death_reason_id, :weapon_id]
  end
end

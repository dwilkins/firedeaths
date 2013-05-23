class AddIndexOnBaseAndWeaponToDeath < ActiveRecord::Migration
  def change
    add_index :deaths, [:base_id, :weapon_id]
    add_index :deaths, [:death_reason_id, :weapon_id]
    add_index :deaths, [:base_id, :death_reason_id]
  end
end

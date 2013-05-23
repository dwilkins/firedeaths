class CreateDeaths < ActiveRecord::Migration
  def change
    create_table :deaths do |t|
      t.integer :user_id
      t.integer :base_id
      t.integer :death_reason_id
      t.integer :weapon_id
      t.integer :death_game_lat
      t.integer :death_game_lon
      t.date :death_day
      t.time :death_time

      t.timestamps
    end
    add_index :deaths, :base_id
    add_index :deaths, :weapon_id
    add_index :deaths, :death_reason_id
    add_index :deaths, :death_day
    add_index :deaths, :death_time
  end
end

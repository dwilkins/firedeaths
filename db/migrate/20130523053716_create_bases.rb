class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.integer :game_lat
      t.integer :game_lon
      t.string :name

      t.timestamps
    end
  end
end

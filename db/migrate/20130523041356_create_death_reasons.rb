class CreateDeathReasons < ActiveRecord::Migration
  def change
    create_table :death_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end

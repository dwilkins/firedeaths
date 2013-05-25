class DropCreatedAtAndUpdatedAtOnDeaths < ActiveRecord::Migration
  def up
    remove_column :deaths, :created_at
    remove_column :deaths, :updated_at
  end

  def down
    add_column :deaths, :created_at, :datetime, :null => false
    add_column :deaths, :updated_at, :datetime, :null => false
  end
end

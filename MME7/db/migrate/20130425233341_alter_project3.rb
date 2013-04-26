class AlterProject3 < ActiveRecord::Migration
  def up
add_column :projects, :latitude,  :float 
add_column :projects, :longitude, :float 
add_column :projects, :gmaps, :boolean 
  end

  def down
  end
end

class AlterProject4 < ActiveRecord::Migration
  def up
  	add_column :projects , :community_id , :integer 
  end

  def down
  end
end

class AlterCommunityProject < ActiveRecord::Migration
  def up
  	rename_column :communities_projects , :communities_id , :community_id
  	rename_column :communities_projects , :projects_id ,:project_id
  end

  def down
  end
end

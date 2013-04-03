class CreateCommunitiesProjectsJoin < ActiveRecord::Migration
  def up
  	create_table :communities_projects , :id => false do |t|
  	t.integer "communities_id"
  	t.integer "projects_id"
  end
end

  def down
  end
end

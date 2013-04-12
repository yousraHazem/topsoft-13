class CreateProjectsUsersJoin < ActiveRecord::Migration
  def up
  	create_table :projects_users, :id => false do |t|
  		t.intger "project_id"
  		t.intger "user_id"
  		
  end
add_index :groups_users, ["project_id","user_id"]
  end

  def down
  	drop_table :projects_users
  end
end

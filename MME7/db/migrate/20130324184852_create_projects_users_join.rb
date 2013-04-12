class CreateProjectsUsersJoin < ActiveRecord::Migration
  def up
  	create_table :projects_users, :id => false do |t|
<<<<<<< HEAD
  		t.integer "project_id"
  		t.integer "user_id"
  		end
    add_index :projects_users, ["project_id","user_id"]
=======
  		t.intger "project_id"
  		t.intger "user_id"
  		
  end
add_index :groups_users, ["project_id","user_id"]
>>>>>>> 80cdefc848873ab6cca888113104c71bd3be74c6
  end

  def down
  	drop_table :projects_users
  end
end

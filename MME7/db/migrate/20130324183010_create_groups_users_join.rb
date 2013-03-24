class CreateGroupsUsersJoin < ActiveRecord::Migration
  def up
  	create_table :groups_users, :id => false do |t|
  		
  		t.intger "group_id"
  		t.intger "user_id"
  end
add_index :groups_users, ["group_id","user_id"]
end 
  def down
  	drop_table :groups_users
  end
end

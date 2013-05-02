class AlterProjects < ActiveRecord::Migration
  def up
  	remove_column :projects , :private_or_public 
  	remove_column :projects , :admin_or_member
  end

  def down
  end
end

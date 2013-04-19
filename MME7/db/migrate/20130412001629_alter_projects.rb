<<<<<<< HEAD
class AlterProjects < ActiveRecord::Migration
  def up
  	remove_column :projects , :private_or_public 
  	remove_column :projects , :admin_or_member
=======
 class AlterProjects < ActiveRecord::Migration
  def up
    remove_column :projects , :private_or_public 
    remove_column :projects , :admin_or_member
>>>>>>> master
  end

  def down
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master

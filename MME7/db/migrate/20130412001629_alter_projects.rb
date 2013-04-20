<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
class AlterProjects < ActiveRecord::Migration
  def up
  	remove_column :projects , :private_or_public 
  	remove_column :projects , :admin_or_member
<<<<<<< HEAD
=======
=======
 class AlterProjects < ActiveRecord::Migration
  def up
    remove_column :projects , :private_or_public 
    remove_column :projects , :admin_or_member
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
  end

  def down
  end
<<<<<<< HEAD
end
=======
<<<<<<< HEAD
end
=======
end
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a

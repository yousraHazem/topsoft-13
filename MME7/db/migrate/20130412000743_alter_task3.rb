<<<<<<< HEAD
class AlterTask3 < ActiveRecord::Migration
  def up
  	change_column :tasks , :assigned , :boolean , :default => false
=======
<<<<<<< HEAD
class AlterTask3 < ActiveRecord::Migration
  def up
  	change_column :tasks , :assigned , :boolean , :default => false
=======
 class AlterTask3 < ActiveRecord::Migration
  def up
    change_column :tasks , :assigned , :boolean , :default => false
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

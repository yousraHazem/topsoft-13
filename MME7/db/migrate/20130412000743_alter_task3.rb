<<<<<<< HEAD
class AlterTask3 < ActiveRecord::Migration
  def up
  	change_column :tasks , :assigned , :boolean , :default => false
=======
 class AlterTask3 < ActiveRecord::Migration
  def up
    change_column :tasks , :assigned , :boolean , :default => false
>>>>>>> master
  end

  def down
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master

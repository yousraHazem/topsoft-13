<<<<<<< HEAD
class AlterTaskUsers < ActiveRecord::Migration
  def up
  	remove_column :task_users , :assigned
=======
 class AlterTaskUsers < ActiveRecord::Migration
  def up
    remove_column :task_users , :assigned
>>>>>>> master
  end

  def down
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master

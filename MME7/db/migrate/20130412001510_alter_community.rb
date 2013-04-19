<<<<<<< HEAD
class AlterCommunity < ActiveRecord::Migration
  def up
  	add_column :communities , :is_dismissed , :boolean
=======
 class AlterCommunity < ActiveRecord::Migration
  def up
    add_column :communities , :is_dismissed , :boolean
>>>>>>> master
  end

  def down
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master

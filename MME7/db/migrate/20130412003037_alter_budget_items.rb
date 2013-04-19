class AlterBudgetItems < ActiveRecord::Migration
  def up
<<<<<<< HEAD
  	remove_column :budget_items , :status
=======
    remove_column :budget_items , :status
>>>>>>> master
  end

  def down
  end
end

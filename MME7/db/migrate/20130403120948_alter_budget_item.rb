class AlterBudgetItem < ActiveRecord::Migration
  def up
  	add_column :budget_items , :spent, :integer
<<<<<<< HEAD
  	add_column :budget_items , :project_id , :integer
=======
  	#add_column :budget_items , :project_id , :integer
>>>>>>> master
  	add_column :budget_items , :total , :integer
  end

  def down
  end
end

class AlterBudgetItem < ActiveRecord::Migration
  def up
  	add_column :budget_items , :spent, :integer
<<<<<<< HEAD
  	add_column :budget_items , :project_id , :integer
=======
<<<<<<< HEAD
  	add_column :budget_items , :project_id , :integer
=======
  	#add_column :budget_items , :project_id , :integer
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
  	add_column :budget_items , :total , :integer
  end

  def down
  end
end

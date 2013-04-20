class AlterBudgetComponents < ActiveRecord::Migration
  def up
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
  	remove_column :budget_components , :unit_price
  	add_column :budget_components , :unit_price , :integer
  	remove_column :budget_components , :total
  	add_column :budget_components , :total , :integer
<<<<<<< HEAD
=======
=======
    remove_column :budget_components , :unit_price
    add_column :budget_components , :unit_price , :integer
    remove_column :budget_components , :total
    add_column :budget_components , :total , :integer
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

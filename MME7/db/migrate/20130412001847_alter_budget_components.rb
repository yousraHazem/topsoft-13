class AlterBudgetComponents < ActiveRecord::Migration
  def up
<<<<<<< HEAD
  	remove_column :budget_components , :unit_price
  	add_column :budget_components , :unit_price , :integer
  	remove_column :budget_components , :total
  	add_column :budget_components , :total , :integer
=======
    remove_column :budget_components , :unit_price
    add_column :budget_components , :unit_price , :integer
    remove_column :budget_components , :total
    add_column :budget_components , :total , :integer
>>>>>>> master
  end

  def down
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master

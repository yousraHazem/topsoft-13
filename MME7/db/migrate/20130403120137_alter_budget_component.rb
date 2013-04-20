class AlterBudgetComponent < ActiveRecord::Migration
  def up
  	add_column :budget_components , :budget_item_id , :integer
<<<<<<< HEAD
  	add_column :budget_components , :spent , :integer
  	add_column :budget_components , :quantity_purchased , :integer , :default=>0
  	change_column :budget_components , :status ,:string , :default=> "Pending"
=======
<<<<<<< HEAD
  	add_column :budget_components , :spent , :integer
  	add_column :budget_components , :quantity_purchased , :integer , :default=>0
  	change_column :budget_components , :status ,:string , :default=> "Pending"
=======
   	add_column :budget_components , :spent , :integer
   	add_column :budget_components , :quantity_purchased , :integer , :default=>0
   	change_column :budget_components , :status ,:string , :default=> "Pending"
>>>>>>> master
>>>>>>> 69fba8164e859d3d06a7b420b11f2831459d0c3a
  	rename_column :budget_components , :quantity ,:total_quantity
  end

  def down
  end
end

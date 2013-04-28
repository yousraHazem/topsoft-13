class AlterBudgetComponent < ActiveRecord::Migration
  def up
<<<<<<< HEAD
  	add_column :budget_components , :budget_item_id , :integer
  	add_column :budget_components , :spent , :integer
  	add_column :budget_components , :quantity_purchased , :integer , :default=>0
  	change_column :budget_components , :status ,:string , :default=> "Pending"
  	rename_column :budget_components , :quantity ,:total_quantity
=======
    #add_column :budget_components , :budget_item_id , :integer
    #add_column :budget_components , :spent , :integer
    add_column :budget_components , :quantity_purchased , :integer , :default=>0
    change_column :budget_components , :status ,:string , :default=> "Pending"
    rename_column :budget_components , :quantity ,:total_quantity
>>>>>>> master
  end

  def down
  end
end

class AlterBudgetComponent < ActiveRecord::Migration
  def up
    #add_column :budget_components , :budget_item_id , :integer
    #add_column :budget_components , :spent , :integer
    add_column :budget_components , :quantity_purchased , :integer , :default=>0
    change_column :budget_components , :status ,:string , :default=> "Pending"
    rename_column :budget_components , :quantity ,:total_quantity
  end

  def down
  end
end

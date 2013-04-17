class AlterBudgetComponent < ActiveRecord::Migration
  def up
  add_column :budget_components , :quantity_purchased, :integer, :default=>0
  rename_column :budget_components , :quantity ,:total_quantity
  end

  def down
  rename_column :budget_components , :total_quantity, :quantity 
  end
end

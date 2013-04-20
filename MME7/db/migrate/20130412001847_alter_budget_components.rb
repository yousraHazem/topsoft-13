class AlterBudgetComponents < ActiveRecord::Migration
  def up
    remove_column :budget_components , :unit_price
    add_column :budget_components , :unit_price , :integer
    remove_column :budget_components , :total
    add_column :budget_components , :total , :integer
  end

  def down
  end
end
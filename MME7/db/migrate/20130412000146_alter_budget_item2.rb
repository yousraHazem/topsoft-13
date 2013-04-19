class AlterBudgetItem2 < ActiveRecord::Migration
  def up
    remove_column  :budget_items ,:budget_id
  end

  def down
  end
end
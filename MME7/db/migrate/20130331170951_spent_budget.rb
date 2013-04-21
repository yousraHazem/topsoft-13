class SpentBudget < ActiveRecord::Migration
  def up
  	add_column :budget_components , :spent, :integer
  end

  def down
  end
end

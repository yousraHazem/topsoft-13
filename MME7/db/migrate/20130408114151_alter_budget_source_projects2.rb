class AlterBudgetSourceProjects2 < ActiveRecord::Migration
  def up

  add_column :budget_source_projects , :budget_source_id , :integer
  add_column :budget_source_projects , :project_id , :integer
  end

  def down
  end
end

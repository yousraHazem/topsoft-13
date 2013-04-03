class CreateBudgetSourcesProjectsJoin < ActiveRecord::Migration
  def up
  	create_table :budget_sources_projects , :id => false do |t|
  		t.integer "project_id"
  		t.integer "budget_source_id"
  end
end

  def down
  end
end

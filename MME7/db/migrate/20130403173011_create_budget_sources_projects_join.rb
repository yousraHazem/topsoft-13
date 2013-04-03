class CreateBudgetSourcesProjectsJoin < ActiveRecord::Migration
   def up
    create_table :budget_sources_projects, :id=>false do |t|
    	t.references :budget_source
    	t.references :project
    end
  end
  
  def down
  end
end

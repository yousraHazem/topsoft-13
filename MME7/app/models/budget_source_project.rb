class BudgetSourceProject < ActiveRecord::Base
  attr_accessible :budget_source_id , :project_id , :amount
  belongs_to :budget_source
  belongs_to :project
end

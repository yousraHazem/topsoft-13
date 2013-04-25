#encoding: UTF-8
class BudgetSourceProject < ActiveRecord::Base
  attr_accessible :budget_source_id , :project_id , :amount
   belongs_to :project
   belongs_to :budget_source

end

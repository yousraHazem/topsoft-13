class BudgetSourceProject < ActiveRecord::Base
  attr_accessible :budget_source_id , :project_id , :amount
   belongs_to :project
   belongs_to :budget_source


validates :amount , :numericality => { :greater_than_or_equal_to => 0 }
end

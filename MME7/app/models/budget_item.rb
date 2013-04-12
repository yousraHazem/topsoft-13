class BudgetItem < ActiveRecord::Base
   attr_accessible :name, :operational , :task_id ,  :total , :spent , :project_id
  belongs_to :task
  has_many :budget_components
  has_and_belongs_to_many :users
end

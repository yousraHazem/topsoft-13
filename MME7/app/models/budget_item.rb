class BudgetItem < ActiveRecord::Base
   attr_accessible :name , :status , :operational , :task_id , :budget_id ,:project_id,:users_id
  belongs_to :task
  belongs_to :budget
  has_many :budget_components
  has_many :members
  has_and_belongs_to_many :users
end

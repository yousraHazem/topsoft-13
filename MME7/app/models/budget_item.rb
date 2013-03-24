class BudgetItem < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to: task
  belongs_to :budget
  has_many :budget_components
  has_many :members
end

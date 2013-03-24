class BudgetItem < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to: task
end

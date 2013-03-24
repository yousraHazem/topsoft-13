class BudgetComponent < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :budget_item
end

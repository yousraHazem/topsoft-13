class BudgetItemUser < ActiveRecord::Base
  attr_accessible :budget_item_id , :user_id
  belongs_to :user
  belongs_to :budget_item
end

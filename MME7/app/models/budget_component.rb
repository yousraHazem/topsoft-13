class BudgetComponent < ActiveRecord::Base
  attr_accessible :name , :quantity , :unit_price , :status , :total
  belongs_to :budget_item
  has_many :receipts
end

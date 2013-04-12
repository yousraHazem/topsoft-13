class BudgetComponent < ActiveRecord::Base

   attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent

  belongs_to :budget_item
end

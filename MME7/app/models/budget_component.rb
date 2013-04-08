class BudgetComponent < ActiveRecord::Base
   attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent 
  belongs_to :budget_item
  has_many :receipts

  validates :name, :presence => {:message => "Name is required" }
  validates :unit_price, :presence => true , :numericality => {:greater_than =>0}
  validates :total_quantity, :numericality => {:greater_than =>0}
  validates :quantity_purchased, :numericality => {:less_than_or_equal_to => :total_quantity}
 

end

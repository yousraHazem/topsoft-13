class BudgetComponent < ActiveRecord::Base


  attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent
  belongs_to :budget_item

  validates :name, :presence => {:message => "Name is required" }
  validates :unit_price, :presence => true
  validates :quantity_purchased, :presence => true
  validates :total_quantity, :presence => true
  validates :quantity_purchased, :numericality => {:less_than_or_equal_to => :total_quantity , :message => 'Quantity purchased cant be greater than total quantity'}
  validates_numericality_of :quantity_purchased , :message => 'Is not a number'
  validates_numericality_of :unit_price , :message => 'Is not a number'

  def self.search(search,id)
  if search
    find(:all, :conditions => ['name LIKE ? AND budget_item_id = ?', "%#{search}%" , id ]) 
  else
    find(:all, :conditions => ['budget_item_id = ?' , id ])
  end
end
# 'budget_item_id = ? AND name LIKE ?', id , "%#{search}%" 

end

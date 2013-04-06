class BudgetComponent < ActiveRecord::Base


  attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent
  belongs_to :budget_item

  validates :name, :presence => {:message => "Name is required" } , :uniqueness => {:message =>" already exists"}
  validates :unit_price, :presence => true , :numericality => {:greater_than => 0 }
  validates :total_quantity, :numericality => {:greater_than => 0 }
  
  validates :quantity_purchased, :numericality => { :greater_than => 0, :less_than_or_equal_to => :total_quantity }
  

  #validates :total_quantity, :numericality => {:greater_than_or_equal_to => :quantity_purchased }
  #validates :total_quantity, :presence => true , :numericality => {:greater_than => 0 }
  #validates :quantity_purchased, :numericality => {:greater_than => 0 , :less_than_or_equal_to => :total_quantity}
  
  

  def self.search(search,id)
  if search
    find(:all, :conditions => ['name LIKE ? AND budget_item_id = ?', "%#{search}%" , id ]) 
  else
    find(:all, :conditions => ['budget_item_id = ?' , id ])
  end
end
# 'budget_item_id = ? AND name LIKE ?', id , "%#{search}%" 

end

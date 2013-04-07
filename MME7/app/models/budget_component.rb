class BudgetComponent < ActiveRecord::Base


  attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent
  belongs_to :budget_item

validates :name, :presence => {:message => "Name is required" }  
validates_numericality_of :quantity_purchased, :greater_than => 0,
                        :allow_blank => false
validates_numericality_of :total_quantity, :greater_than => 0,
                        :allow_blank => false
validates_numericality_of :quantity_purchased, :less_than_or_equal_to => :total_quantity,
                        :if => Proc.new { |o| !o.total_quantity.nil? } ,
                        :message => "can't be greater than retail price."
  
  

  def self.search(search,id)
  if search
    find(:all, :conditions => ['name LIKE ? AND budget_item_id = ?', "%#{search}%" , id ]) 
  else
    find(:all, :conditions => ['budget_item_id = ?' , id ])
  end
end
# 'budget_item_id = ? AND name LIKE ?', id , "%#{search}%" 

end

class BudgetComponent < ActiveRecord::Base



   attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent

  belongs_to :budget_item


validates :name, :presence => {:message => "يجب ادخال الاسم" } 
validates_numericality_of :unit_price, :greater_than => 0,
                        :allow_blank => false 
validates_numericality_of :quantity_purchased, :greater_than => 0,
                        :allow_blank => false
validates_numericality_of :total_quantity, :greater_than => 0,
                        :allow_blank => false
validates_numericality_of :quantity_purchased, :less_than_or_equal_to => :total_quantity,
                        :if => Proc.new { |o| !o.total_quantity.nil? } ,
                        :message => "الكمية المشتراة يجب الا تزيد عن  مجموع الكمية المحدد"
validates_length_of :unit_price , :maximum=> 4 , :too_long=> "الحد الاقصى 4 ارقام"
validates_length_of :quantity_purchased , :maximum=> 4 , :too_long=> "الحد الاقصى 4 ارقام"
validates_length_of :total_quantity , :maximum=> 4 , :too_long=> "الحد الاقصى 4 ارقام"
validates_length_of :name , :maximum=> 12 , :too_long=> "الحد الاقصى 12 ارقام"

  has_many :receipts
end

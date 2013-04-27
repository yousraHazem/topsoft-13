#encoding: UTF-8
class BudgetItem < ActiveRecord::Base
  attr_accessible :name, :operational , :task_id ,  :total , :spent , :project_id, :user_tokens
  belongs_to :task
  belongs_to :budget
  has_many :budget_components
  has_many :members
  belongs_to :project
  has_many :budget_item_users
  has_many :users, :through => :budget_item_users
  attr_reader :user_tokens   
  def user_tokens=(ids)  
    self.user_ids = ids.split(",")  
  end  

   validates_presence_of :name , :message => "يرجى أدخال الأسم"
  
end

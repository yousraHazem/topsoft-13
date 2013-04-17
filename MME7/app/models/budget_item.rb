class BudgetItem < ActiveRecord::Base
   attr_accessible :name, :status , :operational , :task_id , :budget_id , :total , :spent , :project_id
  belongs_to :task
  belongs_to :budget
  has_many :budget_components
  has_and_belongs_to_many :users
  belongs_to :project

   validates_presence_of :name , :message => "يرجى أدخال الأسم"
   
end

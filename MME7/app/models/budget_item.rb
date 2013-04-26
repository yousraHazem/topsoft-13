#encoding: utf-8
class BudgetItem < ActiveRecord::Base
   attr_accessible :name, :operational , :task_id ,  :total , :spent , :project_id

  belongs_to :task
  belongs_to :budget
  has_many :budget_components
  has_many :members
  has_and_belongs_to_many :users
  belongs_to :project

   validates_presence_of :name , :message => "يرجى أدخال الأسم"
   
end

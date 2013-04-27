class Task < ActiveRecord::Base
  attr_accessible :description , :project_id , :title , :assigned
  has_one :budget_item 

  has_many :users 
  belongs_to :project 
end
 
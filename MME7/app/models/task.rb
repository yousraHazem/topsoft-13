

class Task < ActiveRecord::Base
attr_accessible :description , :project_id
validates_presence_of  :description , :project_id
validates_uniqueness_of :description 
has_one :budget_item
has_many :users, :through => :task_users
has_many :task_users
belongs_to :project
 

  

end

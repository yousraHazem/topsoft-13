class Task < ActiveRecord::Base
validates_presence_of  :description , :project_id
validates_uniqueness_of :description 

 attr_accessible :description , :project_id
 has_one :budget_item
 has_many :users, :through => :task_users
has_many :task_users
 belongs_to :project
 attr_reader :user_tokens

  
end

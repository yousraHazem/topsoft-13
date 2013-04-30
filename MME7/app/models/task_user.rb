#encoding: UTF-8
class TaskUser < ActiveRecord::Base
   attr_accessible :task_id, :user_id 
	belongs_to :task
	belongs_to :user

end
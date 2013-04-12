# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :description , :project_id , :title , :assigned

  has_one :budget_item 
  has_many :users 
  belongs_to :project 
  has_many :task_users
  has_many :users , :through => :task_users
end

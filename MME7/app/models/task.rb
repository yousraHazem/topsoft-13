class Task < ActiveRecord::Base
  attr_accessible :description , :project_id ,:user_tokens
has_one :budget_item 
  has_many :task_users 
  belongs_to :project 
  has_many :users , :through => :task_users
  attr_reader :user_tokens
  
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end

end

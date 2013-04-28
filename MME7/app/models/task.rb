class Task < ActiveRecord::Base
  attr_accessible :description , :project_id , :title , :assigned ,:photo
  has_one :budget_item 
  has_many :users 
  belongs_to :project 
  mount_uploader :photo , ImageUploader

end

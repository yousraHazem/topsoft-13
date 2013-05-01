#encoding: UTF-8
class Task < ActiveRecord::Base
  attr_accessible :description , :project_id , :title , :assigned
  has_one :budget_item 
  has_many :users 
  belongs_to :project 
  validates_presence_of :description , :message => "يجب أن تدخل التفاصيل "
  validates_uniqueness_of :description, :message => "عفوا هذه لتفاصيل قد استخدم من قبل "
end

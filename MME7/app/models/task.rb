class Task < ActiveRecord::Base
attr_accessible :description , :project_id
validates_presence_of  :description , :message => "يجب إضافة التفاصيل"
validates_uniqueness_of :description  , :message => "لقد تم إختيار هذا الاسم من قبل"
has_one :budget_item
has_many :users, :through => :task_users
has_many :task_users
belongs_to :project
 

  

end

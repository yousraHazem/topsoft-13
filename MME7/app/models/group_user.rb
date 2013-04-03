class GroupUser < ActiveRecord::Base
  attr_accessible :group_id , :user_id , :is_creator
  belongs_to :group 
  belongs_to :user

end

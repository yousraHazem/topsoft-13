class GroupUser < ActiveRecord::Base
   attr_accessible :group_id , :user_id , :isCreator
  belongs_to :group 
  belongs_to :user

  validates :user_id, :uniqueness => true

end

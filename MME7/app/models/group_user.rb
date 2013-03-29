class GroupUser < ActiveRecord::Base
   attr_accessible :group_id , :user_id , :is_creator
  belongs_to :group 
  belongs_to :user
<<<<<<< HEAD
end
=======

end
>>>>>>> 55f488d4b099d470c2a679f23f16d07524369907

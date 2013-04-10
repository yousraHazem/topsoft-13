class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :user_id , :community_id, :user_tokens
  
  has_many :posts 
  has_and_belongs_to_many :users
  has_many :group_users 
  has_many :users , :through => :group_users

  attr_reader :user_tokens


def user_tokens=(ids)
	self.user_ids = ids.split(",")
end

end 

class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :community_id

  has_many :posts 
  has_many :groups_users 
  has_many :users , :through => :group_users



end 

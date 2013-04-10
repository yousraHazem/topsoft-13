class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :user_id , :community_id


  has_many :posts 
  has_and_belongs_to_many :users
  has_many :groups_users 
  has_many :users , :through => :group_users



end 

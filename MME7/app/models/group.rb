# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  group_name   :string(50)
#  description  :text
#  levels       :string(255)
#  created_at   :datetime         default => false
#  updated_at   :datetime         not null
#  community_id :integer
#

class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels

  has_many :posts 
  has_and_belongs_to_many :users
  has_many :group_users 
  has_many :users , :through => :group_users

	
  #Author: Donia Amer Shaarawy 22-0270 
  #getMembersNotInGroups takes in a paramater group id and then goes to the user table and find all the users that 
  #are not in this group we will subtrack the users in this group from all users this is done by calling on 
  #getGroupMembers(group_id) method. return a list of users
  def getMembersNotInGroup (group_id)
   b = Group.getGroupMembers(group_id).collect(&:user_id)
   return notGroupUser = User.where("id NOT IN (?)" , b)
  end 
end 

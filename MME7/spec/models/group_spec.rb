require 'spec_helper'
 describe Group do

 	it"should return list of members  not in a group" do
	 group = Group.new(:group_name => "group",:description => "sdsddsdsdsds" , :levels => "parent")
	 group.save
	 groupid = group.id
	 groupuser = GroupUser.new(:group_id => 1 , :user_id => 1, :isCreator => false)
	 groupuser.save
	 groupuser = GroupUser.new(:group_id => 1 , :user_id => 2, :isCreator => false)
	 groupuser.save
	 groupuser = GroupUser.new(:group_id => 2 , :user_id => 3, :isCreator => false)
	 groupuser.save
	 groupuser.getMembersNotInGroup (group_id)
	end 
end

require 'spec_helper'
 describe GroupUser do
  #Author: Donia Amer Shaarawy 22-0270
  #this is to test isGroupCreator
 	it "should return true if he's the creator " do
	 user = User.new(name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
    	address: "nr st distric city", username: "username", password: "password", password_confirmation: "password") 
     user.save
	 userid = user.id
	 group = Group.new(:group_name => "group",:description => "sdsddsdsdsds" , :levels => "parent")
	 group.save
	 groupid = group.id
	 groupCreator = GroupUser.new(:group_id => groupid , :user_id => userid, :isCreator => true)
	 groupCreator.isGroupCreator(groupid,userid)
   end

	it "should return false if he's not the creator " do
	 user = User.new(name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
    	address: "nr st distric city", username: "username", password: "password", password_confirmation: "password") 
	 user.save
	 userid= user.id
	 group = Group.new(:group_name => "asas",:description => "sdsddsdsdsds" , :levels => "parent")
	 group.save
	 groupid= group.id
	 groupCreator = GroupUser.new(:group_id => groupid , :user_id => userid, :isCreator => false)
 	 groupCreator.isGroupCreator(groupid , userid)
    end

    #Author: Donia Amer Shaarawy 22-0270
 #test for members in a group 
	it"should return list of members in a group" do
	 group = Group.new(:group_name => "group",:description => "sdsddsdsdsds" , :levels => "parent")
	 group.save
	 groupid = group.id
	 groupuser = GroupUser.new(:group_id => 1 , :user_id => 1, :isCreator => false)
	 groupuser.save
	 groupuser = GroupUser.new(:group_id => 1 , :user_id => 2, :isCreator => false)
	 groupuser.save
	 groupuser.getGroupMembers(groupid)
	end
end
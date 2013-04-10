require 'spec_helper'
describe GroupUsersController do
#Author: Donia Amer Shaarawy 22-0270
#test for members in a group 
it"should return list of members in a group" do
group = Group.new(:group_name => "group",)
group.save
groupid = group.id
groupuser = GroupUser.new(:group_id => 1 , :user_id => 1, :isCreator => false)
groupuser.save
groupuser = GroupUser.new(:group_id => 1 , :user_id => 2, :isCreator => false)
gropuser.save
groupuser.getGroupMembers(group_id)
end
   

end

require 'spec_helper'
describe GroupUsersHelper do
it "should return true if he's the creator " do
user = User.new(:name => "name 1", :email => "name@hotmail" , :phone_Nr =>"123456" , :address => "aaaaa" , :username => "yasmin1" , :isAdmin => false)
user.save
userid= user.id
group = Group.new(:group_name => "project1" ,:description => "blablablablabla", )
group.save
groupid = group.id
member = GroupUser.new( :group_id =>groupid , :user_id => userid, :is_creator => false )
member.save
member.ifMember(userid , groupid).should be_true
end
end 
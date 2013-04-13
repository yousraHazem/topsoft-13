
require 'spec_helper'

describe GroupUser do
it "should return true if he's the creator " do
user = User.new(:name => "name 1", :email => "name@hotmail" , :phone_Nr =>"123456" , :address => "aaaaa" , :username => "yasmin1" , :isAdmin => false)
user.save
userid= user.id
group = Group.new(:group_name => "project1" , :description=> "jnhb" , :levels => "3")
group.save
groupid = group.id
member = GroupUser.new(:user_id => userid, :group_id =>groupid )
member.save
member.ifMember(userid , groupid)
end
end 
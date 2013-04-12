require 'spec_helper'

describe ProjectUsersHelper do
it "should return true if he's the creator " do
user = User.new(:name => "name 1", :email => "name@hotmail" , :phone_Nr =>"123456" , :address => "aaaaa" , :username => "yasmin1" , :isAdmin => false)
user.save
userid= user.id
project = Project.new(:name => "project1" , :start_date => "7/8/2013" , :end_date => "7/8/2014", :description => "blablablablabla")
project.save
projectid = project.id
member = ProjectUser.new(:user_id => userid, :project_id =>projectid ,  :is_creator => true )
member.save
member.isProjectCreator(userid , projectid)
end
end 

require 'spec_helper'


describe ProjectUser do
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

it"should return list of members in a project" do
	project = Project.new(:project_name => "proj1", :start_date  => "7/8/2013", :end_date => "7/8/2014" , :description => "blablablablablabla")
	project.save
	projectid = project.id
	projectuser = ProjectUser.new(:project_id => 1 , :user_id => 1, :is_creator => false)
	projectuser.save
	projectuser = ProjectUser.new(:project_id => 1 , :user_id => 2, :is_creator => false)
	projectuser.save
	projectuser.getProjectmembers(projectid)
end
end

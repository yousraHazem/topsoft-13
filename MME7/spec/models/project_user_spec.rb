require 'spec_helper'
# Author : Nayera Mohamed 22-3789
describe ProjectUsersController do

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
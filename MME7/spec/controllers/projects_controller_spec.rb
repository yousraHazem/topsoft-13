require 'spec_helper'
describe ProjectsController do

  def valid_attributes
    {:name => 'proj', :start_date => "7/7/2013" , :end_date => "7/8/2014", :description => "blablablablabla"}
  end

  def invalid_attributes
    {:name => 'proj', :start_date => "7/7/2013" , :end_date => "3/4/2011", :description => "blablablablabla"}
  end

  def update_attributes
    {:name => 'proj', :start_date => "7/7/2013" , :end_date => "7/8/2014", :description => "blablablablabla"}
  end

 
end
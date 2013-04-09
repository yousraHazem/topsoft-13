require 'spec_helper'

describe GroupsController do

  def valid_attributes
      {:group_name => 'groupOne', :description => 'descTwo', :levels => 'parent'}
  end

  describe "GET index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
     
      get :index, {}
      #assigns(Community).should eq([community])
    end
  end
end

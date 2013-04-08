require 'spec_helper'

describe CommunitiesController do


  def valid_attributes
      {:title => 'comOne'}
  end




  describe "GET list" do
    it "assigns all communities as @communities" do
      community  = Community.create! valid_attributes
      get :list, {}
      assigns(Community).should eq([community])
    end
  end

end 

  
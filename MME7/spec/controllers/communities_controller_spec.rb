require 'spec_helper'

describe CommunitiesController do


  def valid_attributes
      {:title => 'comOne', :social_profile_info => 'spinfoOne', :contact_info => '12345'}
  end




  describe "GET list" do
    it "assigns all communities as @communities" do
      community  = Community.create! valid_attributes
      puts community
      get :list, {}
      #assigns(Community).should eq([community])
    end
  end

end 

  
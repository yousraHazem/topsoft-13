#require 'spec_helper'

#describe CommunitiesController do

#it"should return the wanted community" do
#community = Community.new(:title => "comOne", :social_profile_info => "http://blah.com", :contact_info => "123456789")
#community.save

#communityid = community.id
#communityTitle = community.title

#CommunitiesController.self.search(communityTitle).should == [communityTitle]
#end
   

#end

require 'spec_helper'
#require 'factory_girl_rails'

describe Community do

  # validation examples ...

  it "should return the wanted community" do
    comOne = Factory(:community, title: "A")
    comTwo = Factory(:community, title: "Aha")
    ComThree = Factory(:community, title: "B")
  
    Community.search("A").should == [A, Aha]
  end
end
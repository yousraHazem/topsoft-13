<<<<<<< HEAD

require 'spec_helper'


describe Community do
  it "has a valid factory" do
    FactoryGirl.create(:community).should be_valid
  end
  

it "is invalid without a title" do
  FactoryGirl.build(:community, title: nil).should_not be_valid
end

it "is invalid without a social_proile_info" do
  FactoryGirl.build(:community, social_profile_info: nil).should_not be_valid
end

let(:community) { FactoryGirl.build(:community) }    

it "has a unique title" do
  older_product = FactoryGirl.create(:community)
  community.title = older_product.title
  community.should_not be_valid
end

=======
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

describe Community do

  # validation examples ...

  it "should return the wanted community" do
    comOne = Factory(:community, title: "A")
    comTwo = Factory(:community, title: "Aha")
    ComThree = Factory(:community, title: "B")
  
    Community.search("A").should == [A, Aha]
  end
>>>>>>> da2c61293000cd85631205090632da6204bb4223
end

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

end

require 'spec_helper'
describe Post do
  it "has a valid factory" do
  FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without a content" do
  FactoryGirl.build(:post, content: nil).should_not be_valid
end
end
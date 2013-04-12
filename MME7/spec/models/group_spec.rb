require "spec_helper"

describe Contact do
  it "has a valid factory" do
    Factory.create(:group).should be_valid
  end

it "is invalid without group_name" do
  	Factory.build(:group, group_name: nil).should_not be_valid
end
end
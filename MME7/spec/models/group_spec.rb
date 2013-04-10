require 'spec_helper'

describe Group do

  before { @group = Group.new(group_name: "Group One", description: "blaaah blaaaah", levels: "parent") }

  subject { @group }

  it { should respond_to(:group_name) } 
  it { should respond_to(:description) }
  it { should respond_to(:levels) }
  
  it { should be_valid }

  describe "when group name is not present" do
    before { @group.group_name = " " }
    it { should_not be_valid }
  end

  describe "when group name is too long" do
    before { @group.group_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when group name is already taken" do
    before do
       group_with_same_name= @group.dup
       group_with_same_name.group_name = @group.group_name
       group_with_same_name.save
  	end
  	it { should_not be_valid }
  end

  describe "when group description is not present" do
	    before { @group.description = " " }
	    it { should_not be_valid }
  end

  describe "when group level is not present" do
	    before { @group.levels = " " }
	    it { should_not be_valid }
  end

end
require 'spec_helper'

describe GroupUser do

  before { @groupUser = GroupUser.new(group_id: "1", user_id: "1", isCreator: "true") }

  
  subject { @groupUser }

  it { should respond_to(:group_id) } 
  it { should respond_to(:user_id) }
  it { should respond_to(:isCreator) }
  
  it { should be_valid }

  

  describe "when group user is already there" do
    before do
       user_with_same_id= @groupUser.dup
       user_with_same_id.user_id = @groupUser.user_id
       user_with_same_name.save
  	end
  	it { should_not be_valid }
  end

  

end
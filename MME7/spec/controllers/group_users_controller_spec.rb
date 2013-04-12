require 'spec_helper'
describe GroupUsersController do
  describe "Post Join" do
    describe "with valid params" do
      it "creates a new groupuser" do       
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
  end
end


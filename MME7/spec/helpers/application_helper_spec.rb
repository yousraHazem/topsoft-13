require "spec_helper"

 def valid_attributes
   { :notification_id=> 1  ,:user_id=> 1 , :read=> false}
   end

describe ApplicationHelper do
  describe "#notifications" do
    it "returns all notifications of the current user as @nots" do
      notifications = NotificationUser.create! valid_attributes
      ApplicationController.any_instance.stub(:current_user).and_return(User.new)
      User.any_instance.stub(:id).and_return(1)
      get :notifications, {:id=> 1}
      assigns(:notifications).should eq([notifications])
    end
  end
end
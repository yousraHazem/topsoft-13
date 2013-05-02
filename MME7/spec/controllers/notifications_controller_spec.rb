require 'spec_helper'
require 'application_helper'

describe NotificationsController do
   #include Devise::TestHelpers
  

  def valid_attributes
   { :notification_id=> 1  ,:user_id=> 1 , :read=> false}
   end

	   describe "GET index" do
      it "assigns new notifications as @nots" do
      ApplicationController.any_instance.stub(:current_user).and_return(User.new)
      User.any_instance.stub(:id).and_return(1)
      nots = NotificationUser.create! valid_attributes
      get :index, {:user_id=> 1, :after =>Time.now + 2592000}
      assigns(:nots).should eq([nots])

      end
      end

   

   describe "GET list" do
      it "assigns new notifications as @notifications" do
      notifications = NotificationUser.create! valid_attributes
      get :list, {:userid=> 1, :after2 =>Time.now + 2592000}
      assigns(:notifications).should eq([notifications])
   end
   end
 


   describe "GET all" do
      it "assigns new notifications as @notifications" do
      notifications = NotificationUser.create! valid_attributes
      ApplicationController.any_instance.stub(:current_user).and_return(User.new)
      User.any_instance.stub(:id).and_return(1)
      get :all, {:id=> 1}
      assigns(:notifications).should eq([notifications])
   end
   end


     describe "GET read" do
      it "assigns new notifications as @notifications" do
      notifications = NotificationUser.create! valid_attributes
    ApplicationController.any_instance.stub(:current_user).and_return(User.new)
      User.any_instance.stub(:id).and_return(1)
      get :read, {:id=> 1}
      assigns(:notifications).should eq([notifications])
   end
   end

end


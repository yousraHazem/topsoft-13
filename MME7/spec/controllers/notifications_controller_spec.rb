require 'spec_helper'

describe NotificationsController do
   include Devise::TestHelpers
  

  def valid_attributes
   { :notification_id=> 1  ,:user_id=> 1 , :read=> false}
   end
	  # describe "GET index" do
   #  login_user
   #    it "assigns new notifications as @nots" do
   #    nots = NotificationUser.create! valid_attributes
   #    get :index, {:notifcation_id => 1 , :user_id=>1}
   #    puts  :nots
   #    assigns(:nots).should eq([nots])

   #    end
   #    end

   

   describe "GET list" do
      it "assigns new notifications as @notifications" do
      notifications = NotificationUser.create! valid_attributes
      get :list, {:userid=> 1, :after2 =>Time.now + 2592000}
      assigns(:notifications).should eq([notifications])
   end
   end
 

      # describe "GET list" do
      #    it "assigns new notifications as @notifications" do
      #       notifications = NotificationUser.new
      #       NotificationUser.should_receive(:where).and_return(notifications)
      #       get :list , {:id=>1}
      #       assigns(:notifications).should eq([notifications])
      #    end
      # end


      # describe "GET all" do
      # it "assigns notifications as @notifications" do
      # notifications = NotificationUser.new 
      # notifications.notification_id = 1
      # notifications.user_id= 1
      # notifications.save
      # get 'all', {:id=>1}
      # assigns(:notifications).should eq([notifications])

      # end
      # end

      # describe "GET read" do
      # it "assigns notifications as @notifications" do
      # notifications = NotificationUser.create! valid_attributes
      # get :read, {:id=>1}
      # assigns(:notifications).should eq([notifications])

      # end
      # end

end

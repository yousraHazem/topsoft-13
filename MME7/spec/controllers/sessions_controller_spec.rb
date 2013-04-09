#Author: Donia Amer Shaarawy 22-0270
#theses are the tests for the create and delete for log in and log out 
require 'spec_helper'

 def valid_attributes
   { username: "username", password: "password" }

   describe "POST create" do
     	describe "with valid params" do
       	   it "creates a new session" do
        	 expect {
        	 post :create, {:user => valid_attributes}
          	 }.to change(Sessions, :count).by(1)
           end
       	    it "assigns a newly created sessions as @session" do
              post :create, {:sessions => valid_attributes}
              assigns(:sessions).should be_a(Sessions)
              assigns(:sessions).should be_persisted
           end
            it "redirects to the created project" do
             post :create, {:sessions => valid_attributes}
             response.should redirect_to(@user)
            end
       end
   end
   describe "DELETE destroy" do
       it "destroys the requested sessions" do
         session = Sessions.create! valid_attributes
         expect {
         delete :destroy, {:id => Sessions.to_param}, valid_session
         }.to change(Sessions, :count).by(-1)
        end
        it "redirects to the users list" do
          user = User.create! valid_attributes
          delete :destroy, {:id => User.to_param}
          response.should redirect_to(root_url)
        end
    end
end  
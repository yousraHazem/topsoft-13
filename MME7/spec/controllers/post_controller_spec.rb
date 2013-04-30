require 'spec_helper'
require 'factory_girl'

describe PostsController do

let(:group){Group.create(:group_name => "group",:description => "sdsddsdsdsds" , :levels => "parent")}
let(:project){Project.create(:name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla" )}
let(:user){User.create(name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
  address: "nr st distric city", username: "username", password: "password", password_confirmation: "password" )}

  def valid_attributes
   {:user_id => user.id, :content => "put valid attributes", :project_id => project.id, :group_id => group.id, :is_group => false}
  end
 
  def invalid_attributes
   {:content => ""}
  end

before :each do
  user = User.create(name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
      address: "nr st distric city", username: "username", password: "password", password_confirmation: "password")
end


describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
        ApplicationController.any_instance.stub(:current_user).and_return(User.new)
        User.any_instance.stub(:id).and_return(1)
          post :createPost, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        ApplicationController.any_instance.stub(:current_user).and_return(User.new)
        User.any_instance.stub(:id).and_return(1)
        User.any_instance.stub(:name).and_return(1)
        notification = Notification.new
        notification.content="jsjsj"
        notification.url="kdkd"
        notification.image="jdjd"
        notification.save
        post :createPost, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the project show" do
        ApplicationController.any_instance.stub(:current_user).and_return(User.new)
        User.any_instance.stub(:id).and_return(1)
        User.any_instance.stub(:name).and_return(1)
        post :createPost, {:post => valid_attributes}
        
        if(:is_group == false)
        response.should redirect_to(:controller => 'projects', :action => "show")
        end

        if(:is_group ==true)
         response.should redirect_to(:controller => 'groups', :action => "show")
        end
      end
    end  
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      post = Post.create! valid_attributes
      expect {
        delete :destroyPost, {:post_id => post.to_param}
      }
    end
      it "redirects to the projects list" do
       post = Post.create! valid_attributes
       delete :destroyPost, {:post_id => post.to_param}
        if(:is_group == false)
         response.should redirect_to(:controller => 'projects', :action => "show")
        end
        if(:is_group ==true)
         response.should redirect_to(:controller => 'groups', :action => "show")
        end
        
    end
  end

     describe "PUT updatePost" do
    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => valid_attributes }
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the project page" do
        
        post = Post.create! valid_attributes
        PostsController.any_instance.stub(:post_url).and_return("test")
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
       
       response.should redirect_to( "http://test.hosttest")
      end
    end
  end
end
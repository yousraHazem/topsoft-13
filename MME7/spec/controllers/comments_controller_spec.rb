require 'spec_helper'
require 'factory_girl'

describe CommentsController do

let(:group){Group.create(:group_name => "group",:description => "sdsddsdsdsds" , :levels => "parent")}
let(:project){Project.create(:name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla" )}
let(:user){User.create(name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
  address: "nr st distric city", username: "username", password: "password", password_confirmation: "password" )}
let(:post){Post.create(content: "dfdsfd0", :id =>1)}

  def valid_attributes
   {:post_id => post.id , :user_id => user.id, :is_group => true, :comment => "dfdfd", :name => user.name}
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
         User.any_instance.stub(:name).and_return("sss")
         put :createComment, {:comment => valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        ApplicationController.any_instance.stub(:current_user).and_return(User.new)
        User.any_instance.stub(:id).and_return(1)
        User.any_instance.stub(:name).and_return("dsdsd")
        notification = Notification.new
        notification.content="jsjsj"
        notification.url="kdkd"
        notification.image="jdjd"
        notification.save
        put :createComment, {:comment => valid_attributes}
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the project show" do
        ApplicationController.any_instance.stub(:current_user).and_return(User.new)
        User.any_instance.stub(:id).and_return(1)
        User.any_instance.stub(:name).and_return("xx")
        put :createComment, {:comment => valid_attributes}
        
        if(:is_group == false)
        response.should redirect_to(:controller => 'projects', :action => "show")
        end

        if(:is_group ==true)
         response.should redirect_to(:controller => 'groups', :action => "show")
        end
      end
    end  
  end

  # describe "DELETE destroy" do
  #   it "destroys the requested post" do
  #     comment = Comment.create! valid_attributes
  #     expect {
  #       delete :destroyComment, {:comment_id => comment.to_param}
  #     }
  #   end
  #     it "redirects to the group or project show" do
  #      comment = Comment.create! valid_attributes
  #      delete :destroyComment, {:comment_id => comment.to_param}
  #       if(:is_group == false)
  #        response.should redirect_to(:controller => 'projects', :action => "show")
  #       end
  #       if(:is_group ==true)
  #        response.should redirect_to(:controller => 'groups', :action => "show")
  #       end
        
  #   end
  # end

  #    describe "PUT updateComment" do
  #   describe "with valid params" do
  #     it "updates the requested comment" do
  #       comment = Comment.create! valid_attributes
  #       put :updateComment, {:id => comment.to_param, :comment => valid_attributes }
  #     end

  #     it "assigns the requested comment as @comment" do
  #       comment = Comment.create! valid_attributes
  #       put :updateComment, {:id => comment.to_param, :comment => valid_attributes}
  #       assigns(:comment).should eq(comment)
  #     end

  #     it "redirects to the project page or group page" do
        
  #       comment = Comment.create! valid_attributes
  #       CommentsController.any_instance.stub(:comment_url).and_return("test")
  #       put :updateComment, {:id => comment.to_param, :comment => valid_attributes}
       
  #      response.should redirect_to( "http://test.hosttest")
  #     end
  #   end
  # end
end
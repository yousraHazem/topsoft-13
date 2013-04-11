require 'spec_helper'
require 'factory_girl'

describe PostsController do

  def valid_attributes
   {:content => "put valid attributes"}
  end

  def invalid_attributes
   {:content => ""}
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        # Assuming there are no other <%= table_name %> in the database, this
        # specifies that the <%= class_name %> created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :updatePost, {:post_id => post.to_param, :post => valid_attributes}
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :updatePost, {:post_id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the show group" do
        post = Post.create! valid_attributes
        put :updatePost, {:post_id => post.to_param, :post => valid_attributes}
        response.should redirect_to("http://test.host/groups/show")
      end
    end



describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :createPost, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
    
    end
  end


      it "assigns a newly created post as @post" do
        post :createPost, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :createPost, {:post => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :updatePost, {:post_id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "re-renders the group show template" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :updatePost, {:post_id =>post.to_param, :post => invalid_attributes}
        response.should redirect_to("http://test.host/groups/show")
      end
    
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :createPost, {:post => valid_attributes}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :createPost, {:post => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
   
  
end
end
describe PostsController do
  before :each do
    @post = FactoryGirl.create(:post)
  end
  
  it "deletes the post" do
    expect{
      delete :destroyPost, id: @post       
    }.to change(Post,:count).by(-1)
  end
    
  it "redirects to group show" do
    delete :destroy, id: @post
    response.should redirect_to(:controller => "groups", :action => 'show')
  end
end

end
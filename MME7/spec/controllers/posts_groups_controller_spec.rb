require 'spec_helper'

describe PostsController do

  def valid_attributes
   {:content => "put valid attributes"}
  end

  def invalid_attributes
   {:content => ""}
  end

describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :createPostGroup, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :createPostGroup, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the group show" do
        post :createPostGroup, {:post => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        post :createPostGroup, {:post => valid_attributes}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'show' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :createPostGroup, {:post => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
  end

  describe "POST update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        post :updatePostGroup, {:id => post.to_param, :post => valid_attributes}
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        post :updatePostGroup, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the show group" do
        post = Post.create! valid_attributes
        post :updatePostGroup, {:id => post.to_param, :post => valid_attributes}
        
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :updatePostGroup, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "re-renders the group show template" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :updatePostGroup, {:id =>post.to_param, :post => invalid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
  end
end



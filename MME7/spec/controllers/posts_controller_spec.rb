require 'spec_helper'
describe PostsController do

	 def valid_attributes
    {:content => 'post 1'}
     end

     def invalid_attributes
    {:content => '  '}
     end

     def update_attributes
    {:content => 'post 1'}
     end

	describe "POST createPost" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :createPost, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @Post" do
        post :createPost, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the project page" do
        post :createPost, {:post => valid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end

     describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :createPost, {:post => invalid_attributes}
        assigns(:post).should be_a_new(Post)
      end

      it "redirects to the project page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :createPost, {:post => invalid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end
  end

   describe "PUT updatePost" do
    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => update_attributes }
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the project page" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end

    describe "with invalid params" do
      it "assigns the  post as @post" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :updatePost, {:id => post.to_param, :post => invalid_attributes}
        assigns(:post).should eq(post)
      end

      it "re-renders the project/show template" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :updatePost, {:id => post.to_param, :post => invalid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end
  end

describe "DELETE destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the project show" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}
      response.should redirect_to(:controller =>'projects' ,:action => 'show')
    end
  end



end
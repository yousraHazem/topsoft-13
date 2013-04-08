require 'spec_helper'

describe PostsController do

  def valid_attributes
   {:content => "put valid attributes"}
  end

  def invalid_attributes
   {:content => ""}
  end
 describe "GET edit" do
    it "assigns the requested post as @post" do
     post = Post.create! valid_attributes
      get :editPost, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        # Assuming there are no other <%= table_name %> in the database, this
        # specifies that the <%= class_name %> created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :updatePost, {:id => post.to_param, :post => valid_attributes}
        response.should redirect_to("http://test.host/groups/show/1")
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :updatePost, {:id => community.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :updatePost, {:id =>post.to_param, :post => invalid_attributes}
        response.should render_template("edit")
      end
    end
  end
end

























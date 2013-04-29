require 'spec_helper'

describe PostsController do

  def valid_attributes
   {:content => "put valid attributes", :is_group => true, :group_id => 24}
  end

  def invalid_attributes
   {:content => ""}
  end


describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :createPost, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :createPost, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :createPost, {:post => valid_attributes}
        if(:is_group == true)
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
      end
    end

    
  end

  
end



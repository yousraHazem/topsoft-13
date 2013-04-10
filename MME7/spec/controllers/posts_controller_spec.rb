require 'spec_helper'
describe PostsController do
 def valid_attributes
 	{:content =>"hello", :group_id => "1",:project_id => "3" }
  end

  def invalid_attributes
    {:content =>"", :group_id => "",:project_id => "" }
  end
  
 describe "DELETE destroy" do
    it "destroys the requested post" do
      @post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => @post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      @post = Post.create! valid_attributes
      delete :destroy, {:id => @post.to_param}
      response.should redirect_to(:action => 'list')
    end
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller. Be sure to keep this updated too.
  
  
end
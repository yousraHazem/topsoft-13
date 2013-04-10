require 'spec_helper'
describe CommentsController do
 def valid_attributes
 	{:post_id => 1 , :user_id => 1 , :comment=>"ahahaha" }
  end

  def invalid_attributes 
    {:post_id => "" , :user_id=> "" , :comment=>""}
  end
  
 describe "DELETE destroy" do
    it "destroys the requested comment" do
      @comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => @comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      @comment = Comment.create! valid_attributes
      delete :destroy, {:id => @comment.to_param}
      response.should redirect_to(:action => 'list')
    end
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller. Be sure to keep this updated too.
  
  
end
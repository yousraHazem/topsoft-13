<<<<<<< HEAD
﻿require 'spec_helper'
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
  
  
=======
require 'spec_helper'
describe CommentsController do

	 def valid_attributes
    {:comment => 'comment 1'}
     end

     def invalid_attributes
    {:comment => '  '}
     end

     def update_attributes
    {:comment => 'comment 1'}
     end

	describe "POST createComment" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :createComment, {:comment => valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @Comment" do
        post :createComment, {:comment => valid_attributes}
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the project page" do
        post :createComment, {:comment => valid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end

     describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :createComment, {:comment => invalid_attributes}
        assigns(:comment).should be_a_new(Comment)
      end

      it "redirects to the project page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :createComment, {:comment => invalid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end
  end

   describe "PUT updateComment" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :updateComment, {:id => comment.to_param, :comment => update_attributes }
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :updateComment, {:id => comment.to_param, :comment => valid_attributes}
        assigns(:comment).should eq(comment)
      end

      it "redirects to the project page" do
        comment = Comment.create! valid_attributes
        put :updateComment, {:id => comment.to_param, :comment => valid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end

    describe "with invalid params" do
      it "assigns the  comment as @comment" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :updateComment, {:id => comment.to_param, :comment => invalid_attributes}
        assigns(:comment).should eq(comment)
      end

      it "re-renders the project/show template" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :updateComment, {:id => comment.to_param, :comment => invalid_attributes}
        response.should redirect_to(:controller =>'projects' ,:action => 'show')
      end
    end
  end

describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the project show" do
      comment = Comment.create! valid_attributes
      delete :destroy, {:id => comment.to_param}
      response.should redirect_to(:controller =>'projects' ,:action => 'show')
    end
  end



>>>>>>> b8831eae3b4ffc7041f8f4037bce62ea27dc7a5e
end
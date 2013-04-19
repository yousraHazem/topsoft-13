require 'spec_helper'
# Author : Nayera Mohamed 22-3789
describe Comment do

 it "should return true if he's the creator " do
	 user = User.new(:first_name => "niro", :last_name => "ibra", :email => "niro@hotmail" , :phone_Nr =>"123456" , :address => "23st" , :username => "niro" , :password => "2345", :isAdmin => false , :task_id => 1 )
	 user.save
	 userid= user.id
	 comment = Comment.new(:post_id =>1  , :user_id => userid, :comment => "okbalblabla" )
	 comment.save
	 commentid= comment.id
	 comment.isCommentCreator(user.id, comment.id)
 end

 it "should return false if he's not the creator " do
	 user = User.new(:first_name => "niro", :last_name => "ibra", :email => "niro@hotmail" , :phone_Nr =>"123456" , :address => "23st" , :username => "niro" , :password => "2345", :isAdmin => false , :task_id => 1 )
	 user.save
	 comment = Comment.new(:post_id =>1  , :user_id => 15, :comment => "okbalblabla" )
	 comment.save
	 commentid = comment.id
	 comment.isCommentCreator(15 , commentid)
 end
   
end
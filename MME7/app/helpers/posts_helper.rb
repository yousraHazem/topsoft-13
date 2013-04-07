module PostsHelper
	#Author :Salma El Ruby 22-4649 
	#method to check if the user is the owner of this post, takes as parameters the user id and the post id and returns boolean 
	def isCreator (current_user, post_id)
		Post.where(:user_id => current_user, :post_id => post_id ).exists?
end

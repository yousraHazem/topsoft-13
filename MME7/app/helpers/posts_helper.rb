module PostsHelper
	#method to check if the user is the owner of this post
	def isCreator (current_user, post_id)
		Post.where(:user_id => current_user, :post_id => post_id ).exists?
end

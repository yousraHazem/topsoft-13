class CommentsController < ApplicationController
	
	def newComment
		@comment = Comment.new
	end


	

end

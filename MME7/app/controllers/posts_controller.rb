class PostsController < ApplicationController


  def delete
    @post = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

    def list 
	@post = Post.all
    end

	
	# Riham Gamal 22-3871
	# find the post you want to edit
	def editPost
		@post = Post.find(params[:id])
	end

	# Riham Gamal 22-3871
	# update the post by finding its id and changing the fields
	def updatePost
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])
			flash[:notice] = "Post successfully updated"
			render("editPost")
		else
			flash[:notice] = "Post could not be updated"
			# render("editPost")
		end
	end

	# add a new post 
	def newPost
		@post = Post.new
	end

# Salma El Ruby 22-4649
# deletes posts
  def delete
    @post = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

def create
        @post = Post.new(params[:post])
        if @post.save
            #@group.isGroupCreator(current_user.id) == 'true'
            render ('create')
        else
            render ('new')
        end
    end



# Salma El Ruby 22-4649
# displays all available posts 
    def list 
	@post = Post.all
    end


end

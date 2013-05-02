class GalleriesController < ApplicationController

    def show
		@project_id = params[:project_id]
		@gallery = Gallery.where(:project_id => params[:project_id])
	end

	def new
		@project_id = params[:project_id]
		@gallery = Gallery.new
	end


	def create 
		@project_id = params[:project_id]
		@gallery = Gallery.new(params[:gallery])
		if @gallery.save
			redirect_to(:action => 'show', :project_id => @project_id )
		else
			render('new')
	    end
    end
	
 def destroy
 	@projectid = params[:project_id]
    Gallery.find(params[:id]).destroy
    redirect_to(:controller => 'galleries',:action => 'show', :project_id => @projectid)
   
  end


end

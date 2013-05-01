class GalleriesController < ApplicationController

    def show
		@project_id = params[:project_id]
		@gallery = Gallery.where(:project_id => params[:id])
	end

	def new
		@project_id = params[:id]
		@gallery = Gallery.new
	end


	def create 
		@project_id = params[:id]
		@gallery = Gallery.new(params[:gallery])
		if @gallery.save
			redirect_to(:action => 'show', :id=> @project_id)
		else
			render('new')
	    end
    end

	def edit 
		@project_id = params[:project_id]
		@gallery = Gallery.find(params[:id])
	end

	def update
		@project_id = params[:project_id]
		@gallery = Gallery.find(params[:id])
		if @gallery.update_attributes(params[:photo])
			redirect_to(:action => 'show', :id => @gallery.project_id , :project_id=> @project_id)
		else
			render('edit')

		end
	end

 def destroy
    Gallery.find(params[:gallery_id]).destroy
    redirect_to(:controller => 'galleries',:action => 'show', :id => params[:project_id])
   
  end

end

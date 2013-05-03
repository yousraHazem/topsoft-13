#encoding: UTF-8
class GalleriesController < ApplicationController
	# Author :salma el ruby 22-4649
	# this method shows the available photos in gallery
	# Arg: takes project_id
    # returns the gallery 
    def show
		@project_id = params[:project_id]
		@gallery = Gallery.where(:project_id => params[:project_id])
	end

    # Author :salma el ruby 22-4649
    # this method creates new gallery in a certain project
    # Arg: takes project_id
    # returns : new created gallery 
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

   # Author :salma el ruby 22-4649
   # this method deletes photo in a gallery
   # Arg: takes project_id
   # returns : same page of show without the deleted gallery
   def destroy
 	@projectid = params[:project_id]
    Gallery.find(params[:id]).destroy
    redirect_to(:controller => 'galleries',:action => 'show', :project_id => @projectid)
    end


end

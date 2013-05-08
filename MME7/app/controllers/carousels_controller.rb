#encoding: UTF-8
class CarouselsController < ApplicationController

# Author : yasmin mahmoud this method gets all the values with show is true #no arguments or return 
def index
	@carousels = Carousel.where(:show => true)
end

#Author: yasmin mahmoud lis all the carousels no arugments or return 
	def list
		@carousels = Carousel.all
	end

#Author yasmin this method gets the variales of a certain carousel 
	def show 
	@carousel = Carousel.find(params[:id])
	end
#Author yasmin this method makes an instanse variales of a certain carousel 
	def new
		@carousel = Carousel.new
		@projects = Project.all
	end
# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table no arguments or returns
	def create 
		@carousel = Carousel.new(params[:carousel])
		if @carousel.save
			redirect_to(:action => 'show' , :id=> @carousel.id)
		else
			render('new')
	end
end

# Author :Yasmin Mahmoud 22-1787 , Method edit finds the carousel with the id taken from the params 

	def edit  
		@carousel = Carousel.find(params[:id])
		@project = @carousel.project_id
		@projects = Project.all
	end
# Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table takes to returns 
	def update

		@carousel = Carousel.find(params[:id])
		@project = params[:project_id]
		if @carousel.update_attributes(params[:carousel])
			redirect_to(:action => 'show' , :id=> @carousel.id)
			
		else
			render('edit')

		end
	end


	def delete
      @carousel = Carousel.find(params[:id])
    end
#Author :yasmin mahmoud 22-1787 this method deletes a certain row in the table no returns or arguments 
    def destroy
      Carousel.find(params[:id]).destroy
      redirect_to(:action => 'list')
    end


end


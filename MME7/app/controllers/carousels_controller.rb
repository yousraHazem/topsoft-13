#encoding: UTF-8
class CarouselsController < ApplicationController


def index
	@carousels = Carousel.where(:show => true)
	end

	def list
		@carousels = Carousel.all
	end

	def show 
	@carousel = Carousel.find(params[:id])
	end

	def new
		@carousel = Carousel.new
		@projects = Project.all
	end

	def create 
		@carousel = Carousel.new(params[:carousel])
		if @carousel.save
			redirect_to(:action => 'list')
		else
			render('new')
	end
end


	def edit  
	@carousel = Carousel.find(params[:id])
	@project = @carousel.project_id
	@projects = Project.all
	end

	def update

		@carousel = Carousel.find(params[:id])
		@project = params[:project_id]
		if @carousel.update_attributes(params[:carousel])
			redirect_to(:action => 'list')
			
		else
			render('edit')

		end
	end
	def delete
      @carousel = Carousel.find(params[:id])
    end

    def destroy
      Carousel.find(params[:id]).destroy
      redirect_to(:action => 'list')
    end


end


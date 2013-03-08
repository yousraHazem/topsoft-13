class UsersController < ApplicationController
def new
  @user = User.new
end

	def create
  	@user = User.new(params[:user])
  	if @user.save
  		puts "AAAAAAAAAAAAA"
    	redirect_to home_index_url, :notice => "Signed up!"
  	else
  		puts "BBBBBBBBBBBB"
    	render "new"
  	end
	end 
end

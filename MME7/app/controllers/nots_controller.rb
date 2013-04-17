class NotsController < ApplicationController
 def index
 	@nots = NotUser.where(:user_id=> 1)
 end

end

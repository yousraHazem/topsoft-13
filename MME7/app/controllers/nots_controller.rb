class NotsController < ApplicationController
 def index
 	@nots = NotUser.where("user_id = ? and created_at > ?", params[:user_id], Time.at(params[:after].to_i + 1))
 end

end

class NotsController < ApplicationController
 def index
 	@nots = NotUser.where("user_id = ? and created_at > ?", params[:user_id], Time.at(params[:after].to_i + 1))#.order('created_at DESC')
 end

 def list
 	@notifications = NotUser.where("user_id = ? and created_at > ?", params[:userid], Time.at(params[:after2].to_i + 1))
 end

end

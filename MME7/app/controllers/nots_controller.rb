class NotsController < ApplicationController
	
 def index
 	@nots = NotUser.where("user_id = ? and created_at > ?", params[:user_id], Time.at(params[:after].to_i + 1))#.order('created_at DESC')
 end

 def list
 	@notifications = NotUser.where("user_id = ? and created_at > ?", params[:userid], Time.at(params[:after2].to_i + 1))# .order('created_at DESC')
 end

 def all
    @notifications = NotUser.where("user_id = ? ", 1).order('created_at DESC')
    @notifications.each do |notification|
      notification.update_attributes(:read=>true)
    end
 end

end

class GroupUsersController < ApplicationController
	def listMembers
		@group_id = params[:id]
		#@users= User.find(:all)
		@users= User.where("first_name like?","%#{params[:q]}%")
        respond_to do |format|
            format.html
            format.json { render :json => @users.map(&:attributes)}
        end
	end

	def addMembers
		@group_id = params[:group_id]
		@user_id= params[:user_id]
		@new_user= GroupUser.new(:group_id => @group_id, :user_id => @user_id)

		 if @new_user.save
           redirect_to(:action => "listMembers", :id => @group_id)
        else
            render ('addMembers')
        end
	end
end 

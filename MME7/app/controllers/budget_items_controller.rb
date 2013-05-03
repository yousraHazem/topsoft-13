#encoding: UTF-8
class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #Author :Yasmin Mahmoud 22-1787
  #Inputs:project_id and Outputs:all  budgetitems 
  #Returs: Array of Budget Items
	def list 
		
		@project =Project.find(params[:id])
		if loged_in?
		@current_user = current_user.id
		@items = BudgetItem.find(:all,:conditions => {:project_id => params[:id]})
	    else 
	    @items = BudgetItem.find(:all,:conditions => {:operational =>true,:project_id => params[:id]})
	    end 
		@total_budget = BudgetItem.sum(:total , :conditions => {:project_id => params[:id]})
		@total_spent = BudgetItem.sum(:spent , :conditions => {:project_id => params[:id]})
		#@project_name = Project.find(params[:id])

		@tasks = Task.find(:all,:conditions=>{:project_id=>params[:id], :assigned=>false})

		@raised = BudgetSourceProject.sum(:amount , :conditions =>{:project_id => params[:id]})
	end 

# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem no returns or arguments 
	def new 
		@project_name = Project.find(params[:id]).name
		@project = params[:id]
		@budget_item  = BudgetItem.new
		@tasks = Task.find(:all,:conditions=>{:project_id=> params[:id], :assigned=>false})
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table no returns or arguments 
 # Author: Sarah Ahmed 22-1278 , enter the selected task from the drop down table and assign it to true 
 #parameters: none , returns :none
	def create 
		@project = params[:id]
		@budget_item  = BudgetItem.new(params[:budget_item])
		if @budget_item.save


			project_name = Project.find(@project).name
            @members = ProjectUser.where(:project_id => params[:id])
            notification = Notification.create(:content=>"#{current_user.name}  قام بانشاء ميزانية جديدة '#{@budget_item.name}' لمشروع '#{project_name}'." , :url =>"/budget_items/list/#{@project}" , :image=>"create budget") 
            current_id = current_user.id
            @members.each do |member|
	            if 	member.user_id == current_id
	             
	            else
	            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
	            end
            end
            
            taskid = @budget_item.task_id
			if !taskid.nil?
			task = Task.find_by_id(taskid)
			  if task.update_attributes(:assigned=>true)
				flash[:notice] = "Task successfully created"
			  else
				flash[:notice] = "Task unsuccessfully created"
				render('new')
			  end
			end

			redirect_to(:action => 'list' , :id => @project)
		else
			render ('new')
		end
	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 
    # Author: Sarah Ahmed 22-1278 , gets the tasks that aren't assigned to any item and adds to it the previously selected one
	def edit
		@project_name = Project.find(params[:id]).name
		@item = params[:item]
		@project = params[:id]  
		@budget_item  = BudgetItem.find(params[:item])


		@tasks = Task.find(:all,:conditions=>{:project_id=> params[:id] , :assigned=>false })

		@task_id = @budget_item.task_id
		@oldtask = Task.find_by_id(@task_id)
		if !@oldtask.nil?
		@tasks << @oldtask
	    end
	end


   # Author: Sarah Ahmed 22-1278 , updates the selected task from the dropdown
   # parameters: none , returns :none 
   # Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table no returns or arguments 
	def update
		@item = params[:item]
		@project = params[:id]
		@budget_item  = BudgetItem.find(params[:item])
		@task_id = params[:task_id]

		if @budget_item.update_attributes(params[:budget_item])


			project_name = Project.find(@project).name
            @members = ProjectUser.where(:project_id => params[:id])
            current_id = current_user.id


		    notification = Notification.create(:content=>"#{current_user.name} قام بتعديل ميزانية '#{@budget_item.name}' التابع لمشروع '#{project_name}'" , :url =>"/budget_items/list/#{@project}" , :image=>"edit budget") 
            @members.each do |member|
	            if 	member.user_id == current_id     
	            else
	            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
	            end
            end

			if !@task_id.nil?
	        @old_task = Task.find(@task_id)
	        @old_task.update_attributes(:assigned=>false)
	        end

            taskid = @budget_item.task_id
			if !taskid.nil?
			task = Task.find_by_id(taskid)
			task.update_attributes(:assigned=>true)
			end
			redirect_to(:action => 'list', :id => @project)

		else

			render('edit')
		end
	end
	
	#Authored by Toka Omar  id:22-1925
    #parameters: none , returns :none 
	def assign_member 
		@item = params[:item]
		@project = params[:id]  
		@budget_item  = BudgetItem.find(params[:item])
		@users = User.where("name like ?" , "#{params[:q]}")
    	respond_to do |format|  
     	format.html  
     	format.json { render :json => @users.map(&:attributes) }  
    	end
	end	

    # Author : Toka Abdelgabar 22-1925
    # Args : takes budget_item_id , user_id , project_id
    # Returns : redirects to page with all members in project 
    # Explanation : this method gets all members not assigned to this budget_item
	def getProjectMembers
      @user_id = params[:user_id]
      @budget_item_id = params[:budget_item_id]
      @project_id = params[:project_id]
      @assignedppl  = BudgetItemUser.find(:all, :conditions=>{:budget_item_id => @budget_item_id})
      @assigned  = BudgetItemUser.find(:all,:select=> 'user_id', :conditions=>{:budget_item_id => @budget_item_id}).collect(&:user_id)
      if @assigned.empty?
        @notassigned = ProjectUser.where(:project_id => @project_id)  
      else
        @notassigned = ProjectUser.where("project_id = ? AND user_id NOT IN (?)", @project_id , @assigned)
      end
  end

end

#encoding: UTF-8
class BudgetComponentsController < ApplicationController

  
	def index
     list
     render('list')
	end 

	def list
		#authorized by: sarah ahmed id=22-1278 
		#Description: calculates progress bar percentage and gets all the budget components of a certain budget item 
		#returns: a list of budget components
		#Arguments: none
		@current_user = current_user
		@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
		@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})
		@item = params[:id]
		@name = BudgetItem.find(@item).name
		@project_id = params[:project_id]
		@components = BudgetComponent.where(:budget_item_id=> params[:id])
		counts = BudgetComponent.where(:budget_item_id=>params[:id], :status=>"اكتمل")
		all = BudgetComponent.where(:budget_item_id=>params[:id])
		count_size = counts.size
		all_size = all.size
		if all_size == 0
			@percent = 0
		else
			@percent = 100*count_size / all_size
	    end
	end

	def create
		#authorized by: sarah ahmed id=22-1278
		#Description: instantiate a new budget component and then updates the spent and total attributes of its budget item
		#returns: none
		#Arguments: none
		@project_id = params[:project_id]
	    @item = params[:id]
	    @budget_item= BudgetItem.find(@item)
		@component = BudgetComponent.new(params[:component])


		if @component.save
			@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
			@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

			@budget_item.update_attributes(:total=>@total,:spent=>@spent)

            
            project_name = Project.find(@project_id).name
            @members = ProjectUser.where(:project_id => params[:project_id])
            notification = Notification.create(:content=>"#{current_user.name}  قام بانشاء عنصر جديد للميزانية '#{@component.name}' لمشروع '#{project_name}'." , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"create budget") 
            current_id = current_user.id
            @members.each do |member|
	            if 	member.user_id == current_id
	             
	            else
	            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
	            end
            end
            
			redirect_to(:action=>'list',:id=> @item , :project_id=>@project_id )
		else
           render('new')
		end

	end

	def edit

		#authorized by: sarah ahmed id=22-1278
		#Description: gets the budget component of the passed id and view its details in the edit form
		#returns: none
		#Arguments: none
		@item = params[:item_id]
		@project_id = params[:project_id]
		@component = BudgetComponent.find(params[:id])

		@old_name = @component.name
		@old_unit_price = @component.unit_price
		@old_quantity_purchased = @component.quantity_purchased
		@old_total_quantity = @component.total_quantity
	
	end

	def update
		#authorized by: sarah ahmed id=22-1278
		#Description: updates the budget component with the new submitted values and then updates the spent and total attributes of the associated budget
		#returns: none
		#Arguments: none
		@item = params[:item_id]
		@project_id = params[:project_id]
		@budget_item= BudgetItem.find(@item)
		@component = BudgetComponent.find(params[:id])

		@old_name = params[:old_name]
		@old_unit_price = params[:old_unit_price]
		@old_quantity_purchased = params[:old_quantity_purchased]
		@old_total_quantity = params[:old_total_quantity]


		if @component.update_attributes(params[:component])
			@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
			@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

            @budget_item.update_attributes(:total=>@total, :spent=>@spent)

            
            project_name = Project.find(@project_id).name
            @members = ProjectUser.where(:project_id => params[:project_id])
            current_id = current_user.id
           
            @new_name = @component.name
		    @new_unit_price = @component.unit_price
		    @new_quantity_purchased = @component.quantity_purchased
		    @new_total_quantity = @component.total_quantity


		    if((@old_name.to_s == @new_name.to_s) && (@old_unit_price.to_i == @new_unit_price.to_i ) && (@old_quantity_purchased.to_i == @new_quantity_purchased.to_i) && (@old_total_quantity.to_i != @new_total_quantity.to_i)) 
		    
			    notification = Notification.create(:content=>"#{current_user.name} قام بتعديل اجمالى الكمية لعنصر '#{@component.name}' التابع لمشروع '#{project_name}'" , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"edit budget") 
	            @members.each do |member|
		            if 	member.user_id == current_id     
		            else
		            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
		            end
	            end

	        else 
	        	if((@old_name.to_s == @new_name.to_s) && (@old_unit_price.to_i == @new_unit_price.to_i ) && (@old_quantity_purchased.to_i != @new_quantity_purchased.to_i) && (@old_total_quantity.to_i == @new_total_quantity.to_i)) 
	                notification = Notification.create(:content=>"#{current_user.name} قام بتعديل الكمية المشتراة لعنصر '#{@component.name}' التابع لمشروع '#{project_name}'" , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"edit budget") 
		            @members.each do |member|
			            if 	member.user_id == current_id     
			            else
			            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
			            end
		            end

		        else
		        	if((@old_name.to_s == @new_name.to_s) && (@old_unit_price.to_i != @new_unit_price.to_i ) && (@old_quantity_purchased.to_i == @new_quantity_purchased.to_i) && (@old_total_quantity.to_i == @new_total_quantity.to_i)) 
                    	notification = Notification.create(:content=>"#{current_user.name} قام بتعديل سعر الوحدة لعنصر '#{@component.name}' التابع لمشروع '#{project_name}'." , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"edit budget") 
		                @members.each do |member|
				            if 	member.user_id == current_id     
				            else
				            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
				            end
		                end

		            else
		            	if((@old_name.to_s != @new_name.to_s) && (@old_unit_price.to_i == @new_unit_price.to_i ) && (@old_quantity_purchased.to_i == @new_quantity_purchased.to_i) && (@old_total_quantity.to_i == @new_total_quantity.to_i)) 
	                        notification = Notification.create(:content=>"#{current_user.name} قام بتعديل الاسم لعنصر '#{@component.name}' التابع لمشروع '#{project_name}'" , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"edit budget") 
			                @members.each do |member|
					            if 	member.user_id == current_id     
					            else
					            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
					            end
			                end
			            else
			            	if((@old_name.to_s == @new_name.to_s) && (@old_unit_price.to_i == @new_unit_price.to_i ) && (@old_quantity_purchased.to_i == @new_quantity_purchased.to_i) && (@old_total_quantity.to_i == @new_total_quantity.to_i)) 
		                    else
		                    	notification = Notification.create(:content=>"#{current_user.name} قام بتعديل عنصر '#{@component.name}' التابع لمشروع '#{project_name}'" , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"edit budget") 
				                @members.each do |member|
						            if 	member.user_id == current_id     
						            else
						            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
						            end
				                end
		                    end
			            end    
			        end
		        end
		    end        
		   redirect_to(:action=>'list', :id=> @item , :project_id=>@project_id )
		else
           render('edit')
		end

    end

	def destroy
		#authorized by: sarah ahmed id=22-1278
		# Description :deletes the component with the passed id and then updates the spent and total attributes of the associated budget
	    #Arguments: none
	    #returns: none
	    @item = params[:item_id]
	    @project_id = params[:project_id]
       
	    @component = BudgetComponent.find(params[:id])
	    @name = @component.name
	    @component.destroy

        project_name = Project.find(params[:project_id]).name
        @members = ProjectUser.where(:project_id => params[:project_id])
        notification = Notification.create(:content=>"#{current_user.name} قام بالغاء عنصر '#{@name}' التابع لمشروع '#{project_name}'" , :url =>"/budget_components/list/#{@item}?name=try2&project_id=#{@project_id}" , :image=>"delete budget") 
        current_id = current_user.id
        @members.each do |member|
            if 	member.user_id == current_id
             
            else
            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
            end
        end
        
	    @budget_item= BudgetItem.find(@item)
	    @total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
		@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

		@budget_item.update_attributes(:total=>@total, :spent=>@spent)

        redirect_to(:action=>'list',:id=> @item , :project_id=>params[:project_id])
	end

end

module GroupUsersHelper
   #Author: Donia Amer Shaarawy 22-0270 
   #this is a method that shows if the current user the person 
   #who is loged in is the creator of the group or not.
   def isGroupCreator(group_id,user_id)
	  GroupUser.where(:group_id => group_id, :user_id => user_id, :isCreator => true).exists?
   end 
   #Author: Donia Amer Shaarawy 22-0270 
   #add a user to a group add it in the join table 
   def addMembers (group_id, user_id)
 	m = GroupUser.new(:group_id => @group_id, :user_id => @user_id)
 	m.save
   end

   def join
      @group_id = params[:id]
      @user_id = params[:user_id] #change to current_user_id
      @newuser= GroupUser.new(:group_id => @group_id, :user_id => @user_id)#change to current_user_id
      @newuser.save
      redirect_to(:controller => 'groups', :action => 'show', :id => @group_id)
   end

    # Author: Sama Akram 22-555 here we find the row where the want to leave user
    # and the group he want to leave to delete the whole row from the db table
   def leave
      @newuser= GroupUser.where(:group_id => params[:id], :user_id => 1)#change to current_user_id
      @newuser.destroy_all
      redirect_to(:controller => 'groups', :action => 'show', :id => params[:id])
   end

   # Author: Mariam Ismail 22-3456
   # This method checks if a user is an already exisiting member in a specific group or not
   def ifMember(group_id,user_id)
      GroupUser.where(:group_id => group_id, :user_id => user_id).exists? #change to current_user_id  
   end

end

module ApplicationHelper


	# def getMembersNotInProject (project_id)
 #     b = Project.get_projectmembers(project_id)
 #     notProjectUser = User.find(:all, :conditions => :user_id != b)
 #    end

 #    def get_projectmembers(project_id)
 # 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
 #    end 


  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end
end




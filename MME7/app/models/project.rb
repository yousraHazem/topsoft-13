class Project < ActiveRecord::Base

    attr_accessible  :name , :start_date , :end_date , :description , :user_tokens
    has_many :posts
    has_many :tasks 
    has_and_belongs_to_many :users
    has_one :budget 
    has_many :project_users
    has_many :users , :through => :project_users
    has_and_belongs_to_many :communities
    has_many :budget_source_projects
    has_many :budget_sources , :through => :budget_source_projects
    has_and_belongs_to_many :budget_sources
    attr_reader :user_tokens
    validates_presence_of :name, :message => "يجب اضافة اسم"
    validates_uniqueness_of :name, :message => "لقض تم اخثيار هذا  ااسم من قبل"

    # Author : Nayera Mohamed 22-3789 , this method checks if the end date is earlier than the start date
    validate :validate_end_date_before_start_date


    def validate_end_date_before_start_date
        if end_date && start_date
             if end_date < start_date
                errors.add(:end_date," تاريخ الانتهاء لا ىجب ان ىكون قبل تاريخ البداىة")
               
            end
        end
    end

    # Author : Nayera Mohamed 22-3789 , this method checks if the start date is earlier than the current date
    validate :validate_start_date_before_current_date
    def validate_start_date_before_current_date
        @current_date = DateTime.now
        if start_date && @current_date
           if start_date < @current_date
                errors.add(:start_date," تاريخ البداىة لا ىجب ان ىكون قبل تاريخ الىوم")
              
            end
        end
    end


	def self.get_projectmembers(project_id)
 	 @projectmembersid = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => project_id }).collect(&:user_id)
  	end


    def getMembersNotInProject (project_id)
     b = Project.get_projectmembers(project_id)
     return notProjectUser = User.where("id NOT IN (?)" , b)
    end 


	def user_tokens=(ids)
	  self.user_ids = ids.split(",")
	end

	def self.getProjectPosts(project_id)
 	     @projectposts = Post.find(:all, :conditions => {:project_id => project_id })
    end 

    
end
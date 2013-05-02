#encoding: UTF-8
class Project < ActiveRecord::Base
    attr_accessible  :name , :start_date , :end_date , :description, :user_tokens  
    validates_presence_of :name, :message => "يجب اضافة اسم"
    validates_uniqueness_of :name, :message => "لقض تم اخثيار هذا  ااسم من قبل"
    validates_presence_of :end_date , :message => "من فضلك ادخل تاريخ نهاية"
    validates_presence_of :start_date, :message => "من فضلك ادخل تاريخ البدء"
    validate :validate_end_date_before_start_date

    # Author : Nayera Mohamed 22-3789 , this method checks if the end date is earlier than the start date
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
        @current_date = Date.today
        if start_date && @current_date
            if start_date < @current_date
                errors.add(:start_date,"تاريخ البداىة لا ىجب ان ىكون قبل تاريخ الىوم")              
            end
        end
    end
    has_many :posts
    has_many :tasks 
    has_and_belongs_to_many :users
    has_one :budget 
    has_many :project_users
    has_many :users , :through => :project_users
    has_and_belongs_to_many :communities
    has_many :budget_source_projects , :dependent => :destroy
    has_many :budget_sources , :through => :budget_source_projects
    attr_reader :user_tokens

    def self.get_projectmembers(project_id)
        @projectmembersid = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => project_id }).collect(&:user_id)
    end

    # Author Riham Gamal 22-3871
    # Arguments users ids 
    # Return the users with the input ids
    def user_tokens=(ids)
      self.user_ids = ids.split(",")
    end

    #Author: Donia Amer Shaarawy 22-0270 
    #getMembersNotInProject takes in a paramater project id and then goes to the user table and find all the users that 
    #are not in this project we will subtrack the users in this project from all users this is done by calling on 
    #get_projectmembers(project_id) method. this is taken from nayera 
    def getMembersNotInProject (project_id)
       b = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => params[:id] }).collect(&:user_id)
       @users = User.where("id NOT IN (?)" , b)
    end 

    def budgetItems(project_id)
     @budgetItems = BudgetItem.where(:project_id => project_id , :total => 0).exists?
    end

end

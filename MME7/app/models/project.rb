class Project < ActiveRecord::Base
    attr_accessible  :project_name , :start_date , :end_date , :description 
    validates_presence_of :project_name
    validates_uniqueness_of :project_name
    # validates_length_of :project_name,:minimum => 4, :maximum => 255
    # validates_presence_of :description, :minimum => 10
    # validates_length_of :description, :maximum => 255
    validate :validate_end_date_before_start_date
    def validate_end_date_before_start_date
        if end_date && start_date
          errors.add(:end_date, " shouldn't be before the Start date") if end_date < start_date
        end
    end
    validate :validate_start_date_before_current_date
    def validate_start_date_before_current_date
        @current_date = DateTime.now
        if start_date && @current_date
          errors.add(:start_date, " shouldn't be before the Current date") if start_date < @current_date
        end
    end

    has_many :posts
    has_many :tasks 
    has_and_belongs_to_many :users
    has_one :budget 
    has_many :project_users
    has_many :users , :through => :project_users

end

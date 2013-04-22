#encoding: utf-8
class Project < ActiveRecord::Base
    attr_accessible  :name , :start_date , :end_date , :description  
    validates_presence_of :name, :message => "يجب اضافة اسم"
    validates_uniqueness_of :name, :message => "لقض تم اخثيار هذا  ااسم من قبل"
    # validates_length_of :project_name,:minimum => 4, :maximum => 255
    # validates_presence_of :description, :minimum => 10
    # validates_length_of :description, :maximum => 255

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



end
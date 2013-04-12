class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info ,:is_dismissed

   has_many :groups
   has_and_belongs_to_many :projects
   validates_presence_of :title

end

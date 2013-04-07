class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info

   has_many :groups, :dependent => :destroy
   has_and_belongs_to_many :projects
   validates_presence_of :title

end

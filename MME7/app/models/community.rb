class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info

   has_many :groups
   validates_presence_of :title
   validates_uniqueness_of :title
   validates_presence_of :social_profile_info

end

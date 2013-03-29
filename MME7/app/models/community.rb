class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info
   has_many :groups
   validates_presence_of :title
end

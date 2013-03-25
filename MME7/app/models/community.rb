class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info
   has_many :groups
end

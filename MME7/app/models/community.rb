class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info

   has_many :groups
   validates_presence_of :title

   def self.search(search)
	if search
		find(:all, :conditions => ['title LIKE ?',"%#{search}%"])
	else 
		find(:all)
	end
end


end

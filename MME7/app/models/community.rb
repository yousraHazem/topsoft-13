class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info

   has_many :groups
   validates_presence_of :title

   # May Atef Badr 22-0579
   # This method takes the input the user types in the search field
   # and compares it with the titles of all communities
   # if the title matches the input it will list the results of the filtering
   # else it won't list anything
   
	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE ?',"%#{search}%"])
		else 
			find(:all)
		end
	end


end

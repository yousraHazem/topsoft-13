#encoding: UTF-8
class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info ,:is_dismissed
   has_many :groups, :dependent => :destroy
   has_and_belongs_to_many :projects
   validates_presence_of :title , :message => "يجب أن تدخل اسم "
   validates_uniqueness_of :title, :message => "عفوا هذا الاسم قد استخدم من قبل "
   validates_presence_of :social_profile_info, :message => "يجب أن تدخل وصف "
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates_format_of :contact_info, :with => VALID_EMAIL_REGEX, :message => " هذ لبريد للكتروني غير صحيح"
   #validates_uniqueness_of :contact_info, :case_sensitive => false, :message => "يرجى احتيار ايميل أحر"

   # May Atef Badr 22-0579
   # This method takes the input the user types in the search field
   # and compares it with the titles of all communities
   # if the title matches the input it will list the results of the filtering
   # else it won't list anything
   # args: community title
   # returns: similar or community searched
   
	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE ?',"%#{search}%"])
		else 
			find(:all)
		end
	end



end


class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info ,:is_dismissed
   has_many :groups, :dependent => :destroy
   has_and_belongs_to_many :projects
   validates_presence_of :title , :message => "يجب أن تدخل اسم "
   validates_uniqueness_of :title, :message => "عفوا هذا الاسم قد استخدم من قبل "
   validates_presence_of :social_profile_info, :message => "يجب أن تدخل وصف "
end

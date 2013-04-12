# == Schema Information
#
# Table name: communities
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  social_profile_info :text
#  contact_info        :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Community < ActiveRecord::Base
   attr_accessible :title , :social_profile_info , :contact_info ,:is_dismissed

   has_many :groups, :dependent => :destroy
   has_and_belongs_to_many :projects
   validates_presence_of :title
   validates_uniqueness_of :title
   validates_presence_of :social_profile_info

end

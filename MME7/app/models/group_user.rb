# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  isCreator  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupUser < ActiveRecord::Base
   attr_accessible :group_id , :user_id , :is_creator
  belongs_to :group 
  belongs_to :user

end


﻿# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  is_creator :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectUser < ActiveRecord::Base
   attr_accessible :project_id , :user_id , :is_creator
  belongs_to :project
  belongs_to :user
end

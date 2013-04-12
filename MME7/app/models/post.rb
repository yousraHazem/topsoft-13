
﻿# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  group_id   :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id , :user_id
	belongs_to :user  
	has_many :comments 
	belongs_to :project
	belongs_to :group 

end

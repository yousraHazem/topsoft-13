﻿class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator
  belongs_to :project
  belongs_to :user
end

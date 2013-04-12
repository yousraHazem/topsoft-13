﻿# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ActiveRecord::Base
    attr_accessible :post_id , :user_id , :comment 
	belongs_to :user 
	belongs_to :post
end

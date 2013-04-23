#encoding: UTF-8
class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id , :user_id, :is_group
	has_many :comments, :dependent => :destroy
	belongs_to :user  
	belongs_to :project
	belongs_to :group 
	validates_presence_of :content, :message => "يجب ألا تكون خالية "
end
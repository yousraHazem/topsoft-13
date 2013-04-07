class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id
	belongs_to :user  #posts creator 
	has_many :comments, :dependent => :destroy
	belongs_to :project
	belongs_to :group 

end

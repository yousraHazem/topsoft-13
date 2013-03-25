class Comment < ActiveRecord::Base
 attr_accessible :content
	belongs_to :user #comments creator
	belongs_to :post

end

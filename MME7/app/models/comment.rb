class Comment < ActiveRecord::Base
 attr_accessible :comment
	belongs_to :user #comments creator
	belongs_to :post

end

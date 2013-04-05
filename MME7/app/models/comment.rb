class Comment < ActiveRecord::Base
 attr_accessible :comment
	belongs_to :user #comments creator
	belongs_to :post

	validates_presence_of :comment

end

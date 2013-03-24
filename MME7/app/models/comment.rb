class Comment < ActiveRecord::Base

	belongs_to :user #comments creator
	belongs_to :post
  # attr_accessible :title, :body
end

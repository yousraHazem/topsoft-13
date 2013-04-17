class NotUser < ActiveRecord::Base
   attr_accessible :not_id , :user_id , :category
   belongs_to :not
   belongs_to :user
end

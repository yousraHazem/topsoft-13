class Not < ActiveRecord::Base
  attr_accessible :content , :url , :image

  has_many :notification_users
  has_many :users ,:through => :notification_users
end

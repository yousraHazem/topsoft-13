class Notification < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content , :url , :image

  has_many :notification_users
  has_many :users ,:through => :notification_users
end

#encoding: UTF-8
class Notification < ActiveRecord::Base
<<<<<<< HEAD
  # attr_accessible :title, :body
=======
>>>>>>> master
  attr_accessible :content , :url , :image

  has_many :notification_users
  has_many :users ,:through => :notification_users
end

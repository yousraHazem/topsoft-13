#encoding: UTF-8
class NotificationUser < ActiveRecord::Base
  attr_accessible :notification_id , :user_id  , :read
   belongs_to :notification
   belongs_to :user
end

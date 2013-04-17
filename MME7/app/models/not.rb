class Not < ActiveRecord::Base
  attr_accessible :content

  has_many :not_users
  has_many :users ,:through => :not_users
end

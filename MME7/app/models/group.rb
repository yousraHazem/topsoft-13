class Group < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users #creators 
  has_many :posts 
  has_and_belongs_to_many :users
end

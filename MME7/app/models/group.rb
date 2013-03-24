class Group < ActiveRecord::Base
  # attr_accessible :title, :body
  has many :users #creators  
end

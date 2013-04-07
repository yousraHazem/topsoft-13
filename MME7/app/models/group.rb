class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :user_id , :community_id

  has_many :posts 
  has_and_belongs_to_many :users
  has_many :groups_users 
  has_many :users , :through => :group_users

  
  # May Atef Badr 22-0579
  # the validations of edit method
  
  validates :group_name, :presence => true,
  						            :length => {:within => 1..50},
  						            :uniqueness => true

  validates :description, :presence => true

  validates :levels, :presence => true




end 

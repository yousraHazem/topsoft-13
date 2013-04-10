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



  # May Atef Badr 22-0579
  # This method takes the input the user types in the search field
  # and compares it with the groups' names 
  # if the name matches the input it will list the results of the filtering
  # else it won't list anything
  
  def self.search(search)
  	if search
  		find(:all, :conditions => ['group_name LIKE ?',"%#{search}%"])
  	else 
  		find(:all)
  	end
  end

end 

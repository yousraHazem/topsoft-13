class Character < ActiveRecord::Base
  attr_accessible :address, :gmaps, :latitude, :longitude, :name, :project_id
  belongs_to :project

  acts_as_gmappable
	def gmaps4rails_address
		address
	end
end

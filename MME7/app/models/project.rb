# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  project_name      :string(255)
#  start_date        :date
#  end_date          :date
#  description       :text
#  private_or_public :boolean
#  admin_or_member   :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible  :project_name , :start_date , :end_date , :description , :private_or_public , :admin_or_member
	has_many :posts
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
	has_many :project_users
	has_many :users , :through => :project_users

end

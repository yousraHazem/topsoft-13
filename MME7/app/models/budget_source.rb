# == Schema Information
#
# Table name: budget_sources
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BudgetSource < ActiveRecord::Base

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
end
end
  attr_accessible :name, :amount , :project_tokens
  has_many :budget_source_projects
  has_many :projects , :through => :budget_source_projects
   attr_reader :project_tokens
   
  def project_tokens=(ids)
    self.project_ids = ids.split(",")
  end

end



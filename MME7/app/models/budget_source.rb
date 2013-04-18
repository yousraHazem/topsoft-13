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

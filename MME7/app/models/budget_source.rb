class BudgetSource < ActiveRecord::Base
  attr_accessible :budget_source_name, :amount  ,:project_tokens
  has_many :budget_source_projects
  has_many :projects , :through => :budget_source_projects
  attr_reader :project_tokens

validates_presence_of :budget_source_name



  def project_tokens=(ids)
    self.project_ids = ids.split(",")
  end
end

class BudgetSource < ActiveRecord::Base
  attr_accessible :name, :amount
 # has_and_belongs_to_many :projects
  has_many :budget_source_projects 
  has_many :projects , :through => :budget_source_projects


def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
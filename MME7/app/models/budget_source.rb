class BudgetSource < ActiveRecord::Base
  attr_accessible :name, :amount
  has_and_belongs_to_many :projects
end

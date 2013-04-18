class Budget < ActiveRecord::Base
   attr_accessible :amount , :raised , :noot_raised , :spent , :not_spent
  belongs_to :project
  has_many :budget_items
end

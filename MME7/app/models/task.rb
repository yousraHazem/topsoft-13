class Task < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one: budget_item 
end

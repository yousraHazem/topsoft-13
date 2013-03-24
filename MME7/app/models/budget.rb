class Budget < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  has_many :budget_items
end

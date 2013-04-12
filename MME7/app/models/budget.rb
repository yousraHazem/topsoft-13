# == Schema Information
#
# Table name: budgets
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  amount      :integer
#  raised      :integer
#  noot_raised :integer
#  spent       :integer
#  not_spent   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Budget < ActiveRecord::Base
   attr_accessible :amount , :raised , :noot_raised , :spent , :not_spent
  belongs_to :project
  has_many :budget_items
end

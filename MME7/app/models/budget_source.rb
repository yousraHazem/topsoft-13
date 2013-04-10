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
  attr_accessible :name, :amount
end

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

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

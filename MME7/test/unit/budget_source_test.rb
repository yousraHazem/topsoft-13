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

require 'test_helper'

class BudgetSourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

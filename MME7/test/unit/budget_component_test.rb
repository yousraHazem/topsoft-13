# == Schema Information
#
# Table name: budget_components
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  quantity   :integer
#  unit_price :integer
#  status     :boolean
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BudgetComponentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

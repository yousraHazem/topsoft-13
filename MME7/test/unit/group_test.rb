# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  group_name   :string(50)
#  description  :text
#  levels       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  community_id :integer
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: communities
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  social_profile_info :text
#  contact_info        :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

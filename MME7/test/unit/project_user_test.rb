# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  is_creator :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProjectUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

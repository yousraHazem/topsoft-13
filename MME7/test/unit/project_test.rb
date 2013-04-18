# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  project_name      :string(255)
#  start_date        :date
#  end_date          :date
#  description       :text
#  private_or_public :boolean
#  admin_or_member   :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

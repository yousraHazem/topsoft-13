class Gallery < ActiveRecord::Base
  attr_accessible :photo, :project_id
  belongs_to :project
  mount_uploader :photo, PhotoUploader
end

class Carousel < ActiveRecord::Base
  attr_accessible :title, :description , :news , :project_id , :show
  belongs_to :project
  mount_uploader :news, NewsUploader
end

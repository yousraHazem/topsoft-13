class Image < ActiveRecord::Base
 attr_accessible :image2
 belongs_to :project
end

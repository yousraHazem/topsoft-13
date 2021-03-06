#encoding: utf-8
class Receipt < ActiveRecord::Base
  attr_accessible :budget_component_id, :image , :name

  belongs_to :budget_component
  mount_uploader :image , ImageUploader
  validates_presence_of :image , :message => "يرجا إدخال الوصل"
  validates_presence_of :name , :message => "يرجا أدخال الإسم"
end
class Receipt < ActiveRecord::Base
  attr_accessible :name , :budget_component_id , :image

  belongs_to :budget_component

end

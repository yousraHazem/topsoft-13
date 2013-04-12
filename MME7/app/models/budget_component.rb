
﻿# == Schema Information
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

class BudgetComponent < ActiveRecord::Base
   attr_accessible :name , :total_quantity , :unit_price , :status , :total , :budget_item_id ,:quantity_purchased , :spent
>>>>>>> master
  belongs_to :budget_item
end

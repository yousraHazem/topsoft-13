class AlterBudget < ActiveRecord::Migration
  def up
  	add_column :budget_components , :budget_item_id , :integer
  end

  def down
  		remove_column :budget_components, :budget_item_id 
  end
end

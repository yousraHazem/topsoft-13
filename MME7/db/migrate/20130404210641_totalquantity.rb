class Totalquantity < ActiveRecord::Migration
  def up
  	change_column :budget_components , :total_quantity ,:integer , :default=> 0
  end

  def down
  end
end

class AlterItem < ActiveRecord::Migration
  def up
  	add_column :budget_items , :spent, :integer
  end

  def down
  end
end

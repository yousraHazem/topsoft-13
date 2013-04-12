class Alteritems < ActiveRecord::Migration
  def up
  	add_column :budget_items , :project_id, :integer
  end

  def down
  end
end

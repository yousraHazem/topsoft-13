class AlterProject < ActiveRecord::Migration
  def up
  	rename_column :projects , :project_name , :name
  end

  def down
  end
end

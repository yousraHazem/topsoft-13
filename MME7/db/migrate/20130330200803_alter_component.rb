class AlterComponent < ActiveRecord::Migration
  def up
  	change_column :budget_components , :status ,:string , :default=> "Pending"
  end

  def down
  	change_column :budget_components , :status ,:string 
  end
end

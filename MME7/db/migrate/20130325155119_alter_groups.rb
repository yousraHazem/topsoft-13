class AlterGroups < ActiveRecord::Migration
  def up
  	remove_column :groups , :user_id 
  	
  end

  def down
  end
end
